# Maintainer: Roshless <pkg@roshless.com>

pkgname=nnrss-qt
pkgver=1.2.1
pkgrel=1
pkgdesc='nano nano rss client in QT'
url='https://git.roshless.me/roshless/nnrss-qt'
arch=('any')
license=('GPL')
depends=('python-pyqt5' 'qt5-base' 'python-requests' 'libnotify')
makedepends=('python-setuptools')
source=("https://git.roshless.me/~roshless/$pkgname/archive/${pkgver}.tar.gz"
        "nnrss-qt.desktop")

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  install -Dm644 nnrss-qt.desktop "$pkgdir/usr/share/applications/nnrss-qt.desktop"

  cd $pkgname-$pkgver
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

md5sums=('6245b822c5c2a8923a2c2ce03554810b'
         'a22ce9790bda6c105744ad122224e1a2')
