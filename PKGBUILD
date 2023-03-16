# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=minuimus
pkgver="3.8.1"
pkgrel=1
pkgdesc="file optimiser script: point it at a file, it makes it smaller without compromising content"
arch=(x86_64)
url="https://birds-are-nice.me/software/minuimus.html"
license=('GPL')
depends=(
  'brotli'
  'gif2png'
  'gifsicle'
  'imagemagick'
  'jpegoptim'
  'libjpeg'
  'libwebp'
  'mupdf-tools'
  'optipng'
  'p7zip'
  'poppler'
  'qpdf'
  'unrar'
  'zip'
)
optdeps=(
  'jbigkit'
  'leanify'        # AUR
  'pngout'         # AUR
  'pdfsizeopt-git' # AUR
)
source=("https://birds-are-nice.me/software/minuimus.zip")
sha256sums=('50360a6ce8570bd8252c342517d23853af59164492b3e280147ea8120f39efc0')

build() {
	cd "$srcdir"
  make all
}

package() {
	cd "$srcdir"
  # The makefile doesn't have any method for setting prefix, so we do the install section here
  mkdir -p "${pkgdir}/usr/bin/"
  cp minuimus_def_helper "${pkgdir}/usr/bin/minuimus_def_helper"
  cp minuimus_woff_helper "${pkgdir}/usr/bin/minuimus_woff_helper"
  cp cab_analyze "${pkgdir}/usr/bin/cab_analyze"
  cp minuimus.pl "${pkgdir}/usr/bin/minuimus.pl"
  cp minuimus_swf_helper "${pkgdir}/usr/bin/minuimus_swf_helper"
}
