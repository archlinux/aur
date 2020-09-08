# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=pyuscope
pkgver=2.1.0
pkgrel=1
pkgdesc='py-gstreamer microscope software for panorama captures using LinuxCNC'
arch=('any')
url='https://github.com/JohnDMcMaster/pyuscope'
license=('BSD')
depends=('python' 'gst-python' 'python-gobject' 'python-pyqt5')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('25a73df1c21366a0d336e46f91ec6dc6c61f97c65d80c2597ee0d6a8d03d34814df16de8b364f5a080265be14893598200e756a8a84dd5517159707433dd118c')

build() {
  cd $pkgname-$pkgver

  python setup.py build
}

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  #install -Dm 644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
