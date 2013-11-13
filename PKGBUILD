# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: poplarch <poplarch@gmail.com>

pkgname=fcitx-cloudpinyin
pkgver=0.3.3
pkgrel=1
pkgdesc='Standalone module for fcitx that uses pinyin API on the internet to provide additional input candidates'
arch=('i686' 'x86_64')
url="https://github.com/fcitx/fcitx-cloudpinyin"
license=('GPL')
depends=('curl' 'fcitx')
makedepends=('cmake')
source=("http://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz")

build() {
  cd ${pkgname}-${pkgver}

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}

sha512sums=('874c2b1f037c14e8f6cdbd174c86014d9f6b2035d1828ecf3c8debc704a5f3469eff7ead50638f26080986d912c6e93fe82b78f1a9161f09b738461d07614814')
