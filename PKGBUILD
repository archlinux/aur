#Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=lua51-luacheck
pkgver=0.23.0
pkgrel=2
pkgdesc="A simple static analyzer"
arch=('i686' 'x86_64')
url="https://github.com/mpeterv/luacheck"
license=('MIT')
makedepends=('luarocks')
depends=('lua51' 'lua-filesystem' 'lua51-filesystem' 'lua51-argparse')
conflicts=()
source=("https://github.com/mpeterv/luacheck/archive/${pkgver}.tar.gz"
        "luacheck")
sha256sums=('b4edf3a7702519502696d4ac7372ed1bd6a82ded63bf81f2b1d7e9b37711be2b'
            'a0f34e7fbe04ef598f03a8645eb8ac5f82c37e8c9fa6421ffffccde0f8e068b3')


package() {
 cd ${srcdir}/luacheck-$pkgver
 mkdir -p $pkgdir/usr/share/lua/5.1/luacheck
 cp -r src/luacheck/ $pkgdir/usr/share/lua/5.1/
 install -D bin/luacheck.lua $pkgdir/usr/share/lua/5.1/luacheck/bin/luacheck 
 install -D ../luacheck $pkgdir/usr/bin/luacheck
}

