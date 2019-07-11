# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="clamtk-mate"
pkgver="0.02.01"
pkgrel="3"
pkgdesc="A simple plugin to allow a right-click, context menu scan of files or folders in MATE Desktop."
url="https://github.com/darkshram/clamtk-mate/"
license=('GPL2' 'Artistic2.0')
arch=('i686' 'x86_64')
depends=('python-caja' 'clamtk')
provides=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('5cbd066cf2c38dab314ba1136b02a228f66036ae8dada9d915dc2fbf655b27e1')

package() {
    cd "${pkgname}-${pkgver}"
    install -d -m755 "${pkgdir}/usr/share/caja-python/extensions"
    install -D -m644 ${pkgname}.py "${pkgdir}/usr/share/caja-python/extensions/"
    for n in ./po/*.mo; do
        install -p -D -m644 $n ${pkgdir}/usr/share/locale/`basename $n .mo`/LC_MESSAGES/${pkgname}.mo
    done
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=4 et syn=sh ft=sh:
