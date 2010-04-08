# $Id$
# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
pkgname=ruby-rmagick
pkgver=2.13.1
_sfdlid=70067
pkgrel=1
pkgdesc="RMagick is an interface between the Ruby programming language and the ImageMagick and GraphicsMagick image processing libraries"
arch=('i686' 'x86_64')
url="http://rmagick.rubyforge.org"
license=('GPL')
depends=('ruby>=1.8.2' 'imagemagick' 'graphicsmagick')
source=("http://rubyforge.org/frs/download.php/${_sfdlid}/RMagick-${pkgver}.tar.bz2")

build() {
  cd "$srcdir/RMagick-$pkgver"
  # the post-install.rb script does not seem to take the prefix into account
  # when installing docs, we have to force it
  ruby setup.rb all --doc-dir=${pkgdir}/usr/share/doc/rmagic || exit 1
  ruby setup.rb install --prefix=$pkgdir || exit 3
}
md5sums=('fa419869d5533884e4556c8b8b390adb')
