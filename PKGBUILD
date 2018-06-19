# Maintainer: zoe <chp321 AT gmail DOT com>

pkgname=pdf-remove-blank-pages
pkgver=0.2
pkgrel=2
pkgdesc="Automatically remove blank pages from pdf. For text-pdf only, not for images-pdf (removes pages with no text in it)"
arch=(any)
url="https://repolinux.wordpress.com/2012/04/05/automatically-remove-blank-pages-from-pdf/"
license=("GPLv3+")
depends=('python' 'bash' 'pdftk' 'poppler' 'gawk')
source=("non-blank-page-ranges.py" "pdf-remove-blank-pages.sh")
md5sums=('1a9c76689a828c18b1263ef11c3ee990' '0e4c76df31ae13d6b3f3b2aca3556ed8')

package() {
   
  mkdir -p $pkgdir/usr/bin/
  install -D -m 0755 $srcdir/non-blank-page-ranges.py \
		             $pkgdir/usr/bin/non-blank-page-ranges.py
  install -D -m 0755 $srcdir/${pkgname}.sh \
		             $pkgdir/usr/bin/${pkgname}
}
