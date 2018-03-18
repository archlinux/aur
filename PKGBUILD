# Maintainer: Faustino Aguilar <faustinoaq.github.io>
pkgname=amber
pkgver=v0.6.7
pkgrel=1
pkgdesc="An open source efficient, cohesive and fun web framework for the Crystal language"
arch=(i686 x86_64)
url='https://github.com/amberframework/amber'
license=(MIT)
depends=('crystal' 'shards' 'sqlite')
source=("https://github.com/amberframework/amber/archive/stable.zip")
sha256sums=('15dafc38a5cfef225572c06b40ff384f1564fbb7e87dd9c7907acd8b30f4b3ec')

build() {
  cd "amber-stable"
  shards --production
  make build
}

package() {
  cd "amber-stable"
  install -Dm755 bin/amber "$pkgdir/usr/bin/amber"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/amber/LICENSE
}
