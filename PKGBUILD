# Maintainer: Rhys Kenwell <redrield+aur@gmail.com>
pkgname=heroku-cli
pkgver=6.14.20
pkgrel=2
_arch=$(uname -m | sed -e "s/86_//; s/i686/x86/")
_dirname="${pkgname}-v${pkgver}-737bba7-linux-${_arch}"
pkgdesc="a tool for creating and managing Heroku apps from the command line"
arch=('i686' 'x86_64')
url="https://devcenter.heroku.com/articles/heroku-cli"
license=('custom' 'ISC')
optdepends=('git: Deploying to Heroku')
provides=('heroku-cli')
conflicts=('heroku-cli' 'heroku-client-standalone' 'heroku-toolbelt' 'ruby-heroku')
source_i686=("https://cli-assets.heroku.com/heroku-cli/channels/stable/${_dirname}.tar.gz")
source_x86_64=("https://cli-assets.heroku.com/heroku-cli/channels/stable/${_dirname}.tar.gz")

package() {
    cd "${srcdir}"

    install -dm 755 "${pkgdir}"/opt
    install -dm 755 "${pkgdir}"/usr/bin
    install -Dm 644 "${_dirname}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    mv "${_dirname}" "${pkgdir}"/opt/heroku-cli
    ln -s /opt/heroku-cli/bin/heroku "${pkgdir}"/usr/bin/heroku
}
md5sums_i686=('9ccef74dcbf7e98afbf964b75da8a66f')
md5sums_x86_64=('5f19a330f2a3a1f71bc1db3d8f5cf4b3')
