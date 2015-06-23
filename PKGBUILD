# Maintainer: sxe <sxxe@gmx.de>

pkgname=flowblade
pkgver=0.18
pkgrel=4
pkgdesc="a multitrack non-linear video editor for Linux"
arch=('any')
url="https://github.com/jliljebl/flowblade"
license=('GPL')
depends=( 'ffmpeg' 'pygtk' 'mlt-python-bindings' 'ladspa' 'sox' 'frei0r-plugins' 'python2-dbus' 'python2-gnomevfs' 'python2-numpy' 'python2-imaging')
conflicts=('flowblade-hg' 'flowblade-git')
provides=('flowblade')

install=flowblade.install
source=(https://github.com/jliljebl/flowblade/archive/v$pkgver.tar.gz)

package() {
  cd $srcdir/$pkgname-$pkgver/$pkgname-trunk
  python2 setup.py install --root=$pkgdir/ --install-lib=/usr/share/pyshared --optimize=1
}

md5sums=('42f9b18020455c81aa15545469acdf96')
