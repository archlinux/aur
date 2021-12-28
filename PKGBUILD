# Maintainer: Hartmut Seichter <hartmut@technotecture.com>

pkgname=hfsprescue
pkgver=3.5
pkgdesc="hfsprescue is a program to recover files from a HFS+ formatted partition"
pkgrel=2
arch=('x86_64')
provides=(${pkgname})
conflicts=('hfsprescue-bin')
url="https://www.plop.at/en/hfsprescue/index.html"
license=('GPL2')
makedepends=()
depends=(glibc)
source=("https://download.plop.at/${pkgname}/${pkgname}-${pkgver}.tar.gz")

sha256sums=('3dd589c518021f8eed2ab4b9d983381897f9ed4450d44361e1eaf599e3fdaf83')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "src/${pkgname}"  "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "man/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -Dm644 "doc/de/${pkgname}.html" "${pkgdir}/usr/share/doc/${pkgname}/de/${pkgname}.html"
  install -Dm644 "doc/de/${pkgname}.pdf"  "${pkgdir}/usr/share/doc/${pkgname}/de/${pkgname}.pdf"
  install -Dm644 "doc/de/${pkgname}.txt"  "${pkgdir}/usr/share/doc/${pkgname}/de/${pkgname}.txt"
  install -Dm644 "doc/en/${pkgname}.html" "${pkgdir}/usr/share/doc/${pkgname}/en/${pkgname}.html"
  install -Dm644 "doc/en/${pkgname}.pdf"  "${pkgdir}/usr/share/doc/${pkgname}/en/${pkgname}.pdf"
  install -Dm644 "doc/en/${pkgname}.txt"  "${pkgdir}/usr/share/doc/${pkgname}/en/${pkgname}.txt"
}
