# Maintainer: Rhys Kenwell <redrield+aur@gmail.com>

pkgname=heroku-cli
pkgver=6.14.41
pkgrel=1
_dirname="${pkgname}-v${pkgver}-47054d2-linux"
pkgdesc="a tool for creating and managing Heroku apps from the command line"
arch=('i686' 'x86_64')
url="https://devcenter.heroku.com/articles/heroku-cli"
license=('custom' 'ISC')
optdepends=('git: Deploying to Heroku')
provides=('heroku-cli')
conflicts=('heroku-cli' 'heroku-client-standalone' 'heroku-toolbelt' 'ruby-heroku')
source_i686=("https://cli-assets.heroku.com/heroku-cli/channels/stable/${_dirname}-x86.tar.gz")
source_x86_64=("https://cli-assets.heroku.com/heroku-cli/channels/stable/${_dirname}-x64.tar.gz")

package() {
    _arch=""
    case $CARCH in
        "x86_64")
            _arch="x64"
            ;;
        "i686")
            _arch="x86"
            ;;
    esac

    cd "${srcdir}"

    install -dm 755 "${pkgdir}"/opt/
    install -dm 755 "${pkgdir}"/usr/bin
    install -Dm 644 "${_dirname}-${_arch}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"


    cp -R "${_dirname}-${_arch}" "${pkgdir}"/opt/heroku-cli
    ln -s /opt/heroku-cli/bin/heroku "${pkgdir}"/usr/bin/heroku
}
md5sums_i686=('a414cb78fcaf5af7d71870d78ef7d491')
md5sums_x86_64=('9378d07a164e209bc01c6cd9a50264b1')
