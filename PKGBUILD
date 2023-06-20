# Maintainer: liupold <rohn.ch@gmail.com>
# Previous Maintainer(s): parnmatt <matt@parnmatt.co.uk>, 2ion <dev@2ion.de>

pkgname=cpdf-bin
pkgver=2.5.1
pkgrel=2
pkgdesc='Coherent PDF commandline tool binary to manipulate PDF files including merge, encrypt, decrypt, scale, crop, rotate, bookmarks, stamp, logos, page numbers, compress, etc.'
arch=('x86_64' 'i686')
url='http://community.coherentpdf.com'
license=('custom')
depends=()
makedepends=('coreutils')
provides=('cpdf')
conflicts=('cpdf')
_pkgname=${pkgname%-bin}
[ "$CARCH" = "x86_64" ] && carch_path="Linux-Intel-64bit"
[ "$CARCH" = "i686" ] && carch_path="Linux-Intel-32bit"

source=("https://github.com/coherentgraphics/cpdf-binaries/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d6dea9050d055f90917afe75d244a7b7b6b6bb2f52da466bc06f3ead08a3e2d6')

package() {
  cd "$srcdir/cpdf-binaries-$pkgver" || return 1
  install -Dm755 "$carch_path/cpdf"   "${pkgdir}/usr/bin/cpdf"
  install -Dm644 LICENSE              "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 cpdfmanual.pdf       "${pkgdir}/usr/share/doc/${_pkgname}/cpdfmanual.pdf"
}
