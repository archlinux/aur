# Maintainer: Faustino Aguilar <faustinoaq.github.io>
pkgname=amber
pkgver=0.2.7
pkgrel=1
pkgdesc="An open source efficient, cohesive and fun web framework for the Crystal language "
arch=(i686 x86_64)
url='https://github.com/amberframework/amber'
license=(MIT)
depends=('crystal' 'shards' 'sqlite')
source=("https://github.com/amberframework/amber/archive/v$pkgver.tar.gz")
sha256sums=('b1fce56cf0f3ae9db13775145c8916a9996d567f95223b67239cba92614a6262')

build() {
  cd "amber-$pkgver"
  shards
  make build
}

package() {
  cd "amber-$pkgver"
  install -Dm755 bin/amber "$pkgdir/usr/bin/amber"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/amber/LICENSE
}
