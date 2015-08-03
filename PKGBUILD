# Maintainer: Mike Cooper (mythmon) <mythmon@gmail.com>

pkgname=grid-cartographer
pkgver=3.0.6
pkgrel=1
pkgdesc='An RPG mapping tool.'
url='http://www.davidwaltersdevelopment.com/tools/gridcart/'
license=('custom')
_tarname="grid_cartographer_v${pkgver//./_}"
source=("http://www.davidwaltersdevelopment.com/tools/gridcart/files/${_tarname}.tar.gz"
        'gridcart')
sha256sums=('d62c35cc11b4dae1be61e3835c0a9a51d6feb36e4032b96ce4ec72d9df6f727f'
            'f2f1d3cab1a7d571945f3eca34b6371c76026ab333cd68926c1cfb84369bc209')
arch=('x86_64')
depends=(libpng12
         gtk3
         mesa)

package() {
    cd "${srcdir}"
    install -Dm755 gridcart "${pkgdir}/usr/bin/gridcart"

    cd "${srcdir}/${_tarname}"
    # Install the program.
    install -Dm755 GridCart64 "${pkgdir}/opt/gridcart/GridCart64"
    unzip base0.zip -d "${pkgdir}/opt/gridcart/"
    install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
