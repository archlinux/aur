# Maintainer: dingjing <dingjing@live.cn>

pkgname=graceful-settings
pkgver=1.0.3
pkgrel=1
pkgdesc='graceful linux settings'
url='https://github.com/graceful-linux/graceful-settings'
arch=('x86_64')
license=('MIT')
groups=('graceful-linux')
depends=('glib2')
makedepends=('qt5-tools' 'make')
source=("https://github.com/graceful-linux/graceful-settings/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('959a3370876c1dd3d55835c56a4197e860d4ea0d7fa2c21c324ad4bc4650c2cd0ffee16859278e59027c87ed8466d83360a71a63853ce98bb8ad0db474166dd6')

prepare() {
#mv $pkgver "graceful-greeter-$pkgver"
  cd $pkgname-$pkgver  
}

build() {
  cd $pkgname-$pkgver
  qmake
  make
}

package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT=$pkgdir install
}
