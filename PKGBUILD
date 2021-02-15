# Maintainer: cubercsl <2014cais01 at gmail dot com>

pkgname=rime-flypy
pkgver=10.7.5
pkgrel=1
pkgdesc="小鹤音形 rime 挂接文件"
arch=('any')
url="http://flypy.com/"
license=('custom')
depends=('rime-lua-hook')
makedepends=('unzip')
backup=('usr/share/rime-data/flypy_sys.txt'
        'usr/share/rime-data/flypy_top.txt'
        'usr/share/rime-data/flypy_user.txt')
source=('rime-flypy.zip::http://ys-f.ys168.com/116124341/318331165/TwfHkwh64532766GOLK46/%E5%B0%8F%E9%B9%A4%E9%9F%B3%E5%BD%A2Rime%E5%B9%B3%E5%8F%B0%E9%BC%A0%E9%A1%BB%E7%AE%A1for%20macOS.zip'
        'rime.lua')
noextract=('rime-flypy.zip')
md5sums=('7d23fe690b887a62f47ab99d103ddc9f'
         '207bb067d10502f6df0dc3924f651456')

prepare() {
    unzip rime-flypy.zip "*/rime/*" -x "*/squirrel*"  "*/default*"
}

package() {
    install -Dm644 rime.lua "$pkgdir"/usr/share/rime-data/lua-recipe/flypy.lua

    cd '小鹤音形Rime平台鼠须管for macOS/rime'

    install -Dm644 build/{flypy,flypydz}.{table,prism,reverse}.bin -t "$pkgdir"/usr/share/rime-data/build
    install -Dm644 flypy.schema.yaml -t "$pkgdir"/usr/share/rime-data
    install -Dm644 flypy_{sys,top,user}.txt -t "$pkgdir"/usr/share/rime-data
    install -Dm644 rime.lua "$pkgdir"/usr/share/rime-data/lua/flypy.lua
}

