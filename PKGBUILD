pkgname='groff-dejavu'
pkgdesc="Generates required files to use DejaVu fonts in groff."
pkgrel=1
pkgver=0
arch=('any')
license=('GPL3')
depends=('groff' 'ttf-dejavu')
makedepends=('fontforge')
source=('build' 'groff-dejavu.sh')
provides=('groff-dejavu')
sha256sums=('SKIP' 'SKIP')

build () {
  ./build
}

package () {
    install -d "${pkgdir}/usr/local/share"
    install -d "${pkgdir}/etc/profile.d"
    cp -r "${srcdir}/font" "${pkgdir}/usr/local/share/groff-dejavu" 
    cp "${srcdir}/groff-dejavu.sh" "${pkgdir}/etc/profile.d" 
}

# vim:set ts=2 sw=2 et:
