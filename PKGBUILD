# Maintainer: cubercsl <2014cais01 at gmail dot com>

pkgname=rime-flypy
pkgver=10.7.6
pkgrel=1
pkgdesc="小鹤音形 rime 挂接文件"
arch=('any')
url="http://flypy.com/"
license=('unknown')
depends=('rime-lua-hook')
optdepends=('ibus-rime: input support'
            'fcitx-rime: input support'
            'fcitx5-rime: input support')
backup=('usr/share/rime-data/flypy_sys.txt'
        'usr/share/rime-data/flypy_top.txt'
        'usr/share/rime-data/flypy_user.txt')
source=("$pkgname-$pkgver.tar.gz::https://github.com/2014CAIS01/rime-flypy/archive/v$pkgver.tar.gz"
        "$pkgname.install")
md5sums=('198ddbc055f62136d96e96a4edd8a63d'
         'c0d624f4fab9d81cab0b77dd205cf598')
install="$pkgname.install"

package() {
    cd "${srcdir}"/"rime-flypy-${pkgver}"/
    install -Dm644 rime.lua "$pkgdir"/usr/share/rime-data/lua-recipe/flypy.lua
    install -Dm644 flypy.schema.yaml -t "$pkgdir"/usr/share/rime-data
    install -Dm644 flypy_{sys,top,user}.txt -t "$pkgdir"/usr/share/rime-data
    install -Dm644 lua/flypy.lua "$pkgdir"/usr/share/rime-data/lua/flypy.lua
    install -Dm644 build/{flypy,flypydz}.{table,prism,reverse}.bin -t "$pkgdir"/usr/share/rime-data/build
}

