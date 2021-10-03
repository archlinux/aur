# Maintainer: cubercsl <2014cais01 at gmail dot com>

pkgname=rime-flypy
pkgver=10.8.2
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/cubercsl/rime-flypy/archive/v$pkgver.tar.gz"
        "$pkgname.install")
sha256sums=('d1432250e510da6bb7c8edffe47c415a307aa3afff230b3b7cc86992fbfa86b9'
            '07487dba48d81c42c647fae3449c0a52fdcee9edc890c65961122b5304b824eb')
install="$pkgname.install"

package() {
    cd "${srcdir}"/"rime-flypy-${pkgver}"/
    install -Dm644 rime.lua "$pkgdir"/usr/share/rime-data/lua-recipe/flypy.lua
    install -Dm644 flypy.schema.yaml -t "$pkgdir"/usr/share/rime-data
    install -Dm644 flypy_{sys,top,user}.txt -t "$pkgdir"/usr/share/rime-data
    install -Dm644 lua/*.lua -t "$pkgdir"/usr/share/rime-data/lua
    install -Dm644 build/{flypy,flypydz}.{table,prism,reverse}.bin -t "$pkgdir"/usr/share/rime-data/build
}

