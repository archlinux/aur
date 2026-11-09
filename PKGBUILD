# Maintainer: RocketDev <ma2014119@outlook.com>

_pkgbase=pwndbg
pkgname=$_pkgbase-bin
pkgver=2026.10.28
pkgrel=1
pkgdesc='Exploit Development and Reverse Engineering with GDB Made Easy (isolated install)'
url='https://github.com/pwndbg/pwndbg'
arch=(x86_64)
license=(MIT)
depends=()
conflicts=(pwndbg)
options=('!debug' '!strip' '!docs')
source=("$url/releases/download/$pkgver/pwndbg_${pkgver}_x86_64-portable.tar.xz"
        LICENSE.md)
b2sums=('d81737e57b4b61a98aa0e21c34c20bb3c3f5462b258822cf53d50385e3b0f9710cf2afbd7ab2657ec5d2ce5e1ee4cc7b41ad0d108af3cb9660ef8074e35bbfca'
        '970dad972f3723e92d6572f4700affd8169333a76f1f3d9afc6f83858a639b3c6e7de6a02b27bc76bba1f2226902df4004ebd078185bed2b345f4deefc8af521')

package() {
    install -Dd "$pkgdir/opt/$pkgname"
    install -Dd "$pkgdir/usr/bin"
    cp -r $_pkgbase/* "$pkgdir/opt/$pkgname"
    ln -sf "/opt/$pkgname/bin/$_pkgbase" "$pkgdir/usr/bin"
    install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
