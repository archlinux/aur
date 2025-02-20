# Contributor: Andreas Baumann <mail at andreas baumann dot cc>

pkgname=passport
pkgver=20240913
pkgrel=1
pkgdesc="a verification and copy program for 5.25-inch Apple II floppy disks"
arch=('x86_64')
url="https://github.com/a2-4am/passport"
license=('GPL3')
depends=()
makedepends=('acme' 'exomizer' 'cadius')
source=("$pkgname-$pkgver.tar.gz::https://github.com/a2-4am/passport/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1205246f07bdae6d33ea8c9faf6f6018765e1ac1c3373b226739f1f9f21836b2')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/share/${pkgname}"
  cp build/passport.dsk "${pkgdir}/usr/share/${pkgname}"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
