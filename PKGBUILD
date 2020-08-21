# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=rime-lua-cloud
pkgver=0.0.0.20200821
_commit=fdea7ea7a4bd6eb26dcb3ad2834306b3b605bc96
pkgrel=1
pkgdesc="RIME 云输入插件"
arch=('any')
url="https://github.com/hchunhui/librime-cloud"
license=('custom')
# dependency for reverse lookup
depends=(   'librime'
            'rime-lua-hook'
            'lua53-socket'
            )
makedepends=()
source=("https://github.com/hchunhui/librime-cloud/archive/$_commit/librime-cloud-$_commit.tar.gz")
sha512sums=('54e9827f8603ab956bc15a0750d96face00f3ec65b2dcc6ede0627b9480514ded3c78352f995cfa78d8394498b4ecce59bf7d5715f6c4cf72346d2907cb99c2f')


package() {
  cd librime-cloud-$_commit

  install -Dm644 scripts/lua/*.lua -t "$pkgdir"/usr/share/rime-data/lua
  install -Dm644 scripts/rime.lua "$pkgdir"/usr/share/rime-data/lua-recipe/cloudpinyin.lua
  
  #install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/
}
