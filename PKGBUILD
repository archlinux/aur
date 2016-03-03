# Maintainer: sxe <sxxe@gmx.de>

pkgname=flowblade
pkgver=1.6
pkgrel=1
pkgdesc="a multitrack non-linear video editor for Linux"
arch=('any')
url="https://github.com/jliljebl/flowblade"
license=('GPL')
depends=( 'ffmpeg' 'pygtk' 'mlt-python-bindings' 'ladspa' 'sox' 'frei0r-plugins' 'python2-dbus' 'python2-gnomevfs' 'python2-gobject' 'python2-numpy' 'python2-imaging')
conflicts=('flowblade-hg' 'flowblade-git')
provides=('flowblade')

install=flowblade.install
#source=(https://www.dropbox.com/s/vmu12w36ov2aza8/flowblade-$pkgver.tar.gz?dl=0)
source=(https://github.com/jliljebl/flowblade/archive/v${pkgver}.tar.gz)

package() {
  cd $srcdir/$pkgname-$pkgver/$pkgname-trunk
  #cd $srcdir/$pkgname-$pkgver 
  python2 setup.py install --root=$pkgdir/ --install-lib=/usr/share/pyshared --optimize=1
}

md5sums=('664914138d53f36c6d49a47c09a64c77')
