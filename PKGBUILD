# Maintaner:   <https://aur.archlinux.org/
# Contributor: rob2uk <rob22uk at gmail dot com>
# Contributor: Skydrome <skydrome@i2pmail.org>
# Contributor: TuxSpirit <tuxspirit AT archlinux DOT fr>

pkgname=rar-beta
_pkgver=5.8.b3
pkgver=5.8~b3
pkgrel=1
pkgdesc="A command-line port of the rar compression utility (beta version or maybe not)"
url="http://www.rarlab.com"
arch=('x86_64')
license=('custom')
backup=('etc/rarfiles.lst')
conflicts=('rar' 'unrar')
provides=('rar' 'unrar')
source=('rar.1' 
        'unrar.1'
        "http://www.rarlab.com/rar/rarlinux-x64-${_pkgver}.tar.gz")
md5sums=('4cffd2771bb4a51e4a68500d799550d8'
         '594b777453751ee331ef241160f31499'
         '32d47b9913f20c8bb903ae0be3f2d66d')

# the checksums of the source from rarlab.com are changing
# almost every day so this will never be correct

package() {
    cd "$srcdir/rar"
    install -Dm755 rar               "$pkgdir/usr/bin/rar"
    install -Dm755 unrar             "$pkgdir/usr/bin/unrar"
    install -Dm755 default.sfx       "$pkgdir/usr/lib/default.sfx"
    install -Dm644 license.txt       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 rarfiles.lst      "$pkgdir/etc/rarfiles.lst"
    install -Dm644 $srcdir/rar.1     "$pkgdir/usr/share/man/man1/rar.1"
    install -Dm644 $srcdir/unrar.1   "$pkgdir/usr/share/man/man1/unrar.1"
    install -Dm644 acknow.txt        "$pkgdir/usr/share/doc/rar-beta/acknow.txt"
    install -Dm644 order.htm         "$pkgdir/usr/share/doc/rar-beta/order.htm"
    install -Dm644 rar.txt           "$pkgdir/usr/share/doc/rar-beta/rar.txt"
    install -Dm644 readme.txt        "$pkgdir/usr/share/doc/rar-beta/readme.txt"
    install -Dm644 whatsnew.txt      "$pkgdir/usr/share/doc/rar-beta/whatsnew.txt"
}
