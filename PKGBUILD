# Maintainer: Roshless <pkg@roshless.com>

pkgname=nnrss-qt
pkgver=1.3.1
pkgrel=2
pkgdesc='nano nano rss client in QT'
url='https://git.roshless.me/roshless/nnrss-qt'
arch=('any')
license=('GPL')
depends=('python-pyqt5' 'qt5-base' 'python-requests' 'libnotify')
makedepends=('python-setuptools')
source=("https://git.roshless.me/nnrss/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        "nnrss-qt.desktop")

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  install -Dm644 nnrss-qt.desktop "$pkgdir/usr/share/applications/nnrss-qt.desktop"

  cd $pkgname-$pkgver
  install -Dm644 "dist/feed_icon.svg" -t "$pkgdir/usr/share/$pkgname/"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

md5sums=('21ed9dcf6dd9deb6cd2377bf0d4a3f7b'
         'a22ce9790bda6c105744ad122224e1a2')
