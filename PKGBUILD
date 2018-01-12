# Maintainer: Rhys Kenwell <redrield+aur@gmail.com>

pkgname=heroku-cli
pkgver=6.15.13
pkgrel=1
_dirname="${pkgname}-v${pkgver}-3dce47c-linux"
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
md5sums_i686=('caf247f6e40ac26108188e182c3e032d')
md5sums_x86_64=('f0a116dd4ea9261274e8f45e6b430000')
