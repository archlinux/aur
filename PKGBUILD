#Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=lua51-luacheck
pkgver=0.21.2
pkgrel=2
pkgdesc="A simple static analyzer"
arch=('i686' 'x86_64')
url="https://github.com/mpeterv/luacheck"
license=('MIT')
makedepends=('luarocks5.1')
depends=('lua51' 'lua-filesystem' 'lua51-filesystem')
conflicts=()
source=("https://github.com/mpeterv/luacheck/archive/${pkgver}.tar.gz"
        "luacheck")
sha256sums=('b1528bd73dc0da2c36dc3f93110a83362553546c2f5a354be0c0162149eb1abc'
            'b75ff5098951e643061279780c4608049656149c76651d9dd78762e2cecd7584')

package() {
 cd ${srcdir}/luacheck-$pkgver
  luarocks-5.1 --tree="$pkgdir/usr" make --deps-mode=none "luacheck-scm-1.rockspec"
  find "$pkgdir/usr" -name manifest -delete
  install ../luacheck $pkgdir/usr/bin
}

