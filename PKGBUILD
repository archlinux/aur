# $Id$
# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
pkgname=ruby-rmagick
pkgver=2.13.0
pkgrel=1
pkgdesc="RMagick is an interface between the Ruby programming language and the ImageMagick and GraphicsMagick image processing libraries"
arch=('i686' 'x86_64')
url="http://rmagick.rubyforge.org"
license=('GPL')
depends=('ruby>=1.8.2' 'imagemagick' 'graphicsmagick')
source=("http://rubyforge.org/frs/download.php/68156/RMagick-${pkgver}.tar.bz2")

build() {
  cd "$srcdir/RMagick-$pkgver"
  # the post-install.rb script does not seem to take the prefix into account
  # when installing docs, we have to force it
  ruby setup.rb all --doc-dir=${pkgdir}/usr/share/doc/rmagic || exit 1
  ruby setup.rb install --prefix=$pkgdir || exit 3
}
md5sums=('f79ff3c6587d3cc3b90c7550e563a59d')
