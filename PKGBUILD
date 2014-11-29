# Mantainer: James An <james@jamesan.ca>
# Contributor: Giuseppe Federico <support@digisoftware.org>
# Contributor: lobisquit <enricolovisotto@gmail.com>

pkgname=jfbchat
pkgver=0.2.4
pkgrel=2
pkgdesc='Application designed to offer you a simple and intuitive Facebook chat client'
url=("http://sourceforge.net/projects/jfbchat/")
arch=('any')
license=('GPL')
depends=('java-runtime>=7')
optdepends=()
makedepends=()
source=(
    "http://heanet.dl.sourceforge.net/project/${pkgname}/${pkgname}_${pkgver}/${pkgname}_${pkgver}.tar.gz"
    desktop
    icon.png
    sh
)

md5sums=(
    '37ea169495c100db12a4bd101c7af740'
    '4a5517164256e05726e86e048991f005'
    'f4be785322fefea711af2e2eab04dbd2'
    '1f7a24b084f2461f3875a3bde85b2c9c'
)

package () {
    cd "${srcdir}/${pkgname}_${pkgver}"
    for jarpath in jfbchat.jar lib/*; do
        jarfile=$(basename $jarpath)
        install -Dm644 "$jarpath" "${pkgdir}/usr/share/java/${pkgname}/${jarfile}"
    done

    install -Dm644 copyright "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -Dm644 README.TXT "${pkgdir}/usr/share/doc/${pkgname}/README"
    cp -R javadoc "${pkgdir}/usr/share/doc/${pkgname}/html"

    cd ..
    install -Dm755 sh "${pkgdir}/usr/bin/jfbchat"
    install -Dm644 desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 icon.png "${pkgdir}/usr/share/java/${pkgname}/icon.png"
}
