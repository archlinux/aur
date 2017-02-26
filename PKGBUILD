# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=dir2pdf 
pkgver=20091018
pkgrel=1
pkgdesc="Creates a pdf including all pictures of a given directory"
url=""
arch=('any')
license=('LPPL')
depends=('texlive-core')
source=(http://ms25.no-ip.info/install-dir2pdf)
md5sums=('16e5f99e36e0f32cbfa647319757bd69')
	 
prepare() {
  sed '23,24s+/usr/local/++' install-dir2pdf > arch-install-dir2pdf
  sed -i '557,567s#^#-- #' arch-install-dir2pdf
  sed -i '668s#^#-- #' arch-install-dir2pdf
}

build() {
  install -d bin share/man/man1
  texlua $srcdir/arch-install-dir2pdf
}

package() {
  install -Dm755 bin/dir2pdf $pkgdir/usr/bin/dir2pdf
}
