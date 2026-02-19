# Maintainer: RocketDev <ma2014119@outlook.com>

_pkgbase=pwndbg
pkgname=$_pkgbase-bin
pkgver=2026.02.18
pkgrel=1
pkgdesc='Exploit Development and Reverse Engineering with GDB Made Easy (isolated install)'
url='https://github.com/pwndbg/pwndbg'
arch=(x86_64)
license=(MIT)
depends=()
options=('!debug' '!strip' '!docs')
source=("$url/releases/download/$pkgver/pwndbg_${pkgver}_x86_64-portable.tar.xz"
        LICENSE.md)
b2sums=('377ca4fa00316903d8dc90fbafa2cd5380c93302cabb8305cad68bf7dc0fd696d0e992fec7338711e8a2a2ebb085a85e620de2ce52f5cf2d16358a1ccc5625f6'
        '970dad972f3723e92d6572f4700affd8169333a76f1f3d9afc6f83858a639b3c6e7de6a02b27bc76bba1f2226902df4004ebd078185bed2b345f4deefc8af521')

package() {
    install -Dd "$pkgdir/opt/$pkgname"
    install -Dd "$pkgdir/usr/bin"
    cp -r $_pkgbase/* "$pkgdir/opt/$pkgname"
    ln -sf "/opt/$pkgname/bin/$_pkgbase" "$pkgdir/usr/bin"
    install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
