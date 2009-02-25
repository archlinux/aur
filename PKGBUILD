# $Id$
# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
pkgname=ruby-rmagick
pkgver=2.9.1
pkgrel=1
pkgdesc="RMagick is an interface between the Ruby programming language and the ImageMagick and GraphicsMagick image processing libraries"
arch=('i686' 'x86_64')
url="http://rmagick.rubyforge.org"
license=('GPL')
depends=('ruby>=1.8.2' 'imagemagick' 'graphicsmagick')
source=("http://rubyforge.org/frs/download.php/51094/RMagick-${pkgver}.tar.bz2")
md5sums=('a10453e29b47386f576a28048d1bc2ad')

build() {
  cd "$srcdir/RMagick-$pkgver"
  # the post-install.rb script does not seem to take the prefix into account
  # when installing docs, we have to force it
  ruby setup.rb all --doc-dir=${pkgdir}/usr/share/doc/rmagic || exit 1
  ruby setup.rb install --prefix=$pkgdir || exit 3
}
