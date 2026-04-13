# Maintainer: Matthias Braun <me@matthiasbraun.eu>
pkgname=swaypwd-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Print the working directory of the foreground process in the focused Sway window"
arch=(x86_64)
url="https://gitlab.com/bullbytes/swaypwd"
license=(AGPL-3.0-or-later)
depends=()
optdepends=("python: Chromium local-file support")
provides=(swaypwd)
conflicts=(swaypwd swaypwd-git)
options=('!strip' '!debug')
source=(
    "swaypwd-${pkgver}-x86_64::https://gitlab.com/api/v4/projects/80488692/packages/generic/swaypwd/${pkgver}/swaypwd-x86_64"
    "swaypwd-${pkgver}-man.1::https://gitlab.com/api/v4/projects/80488692/packages/generic/swaypwd/${pkgver}/swaypwd.1"
    "LICENSE::https://gitlab.com/bullbytes/swaypwd/-/raw/v${pkgver}/LICENSE"
)
b2sums=('d9944ed23925cce2a5d37236191d26e73af159c7245f1a3e91c105cc233b3163428b13ac4ff48cfb9a1a2c514638dda76004def027bfd4b6376a23f10b5bca66'
        '4305aaec1405d699fb672b0ed546ffd34d80fad1ef4d2d942f185f5fa508669be729203ae6aab945a5c43546daec5f129c89e010908deda5e19e7458f3679bf9'
        'b6829320f725e3e45c4807ef5deb4738a691fb3ab146d8531b81fdbccd8376a826c8ec76165985cdf37d534f68e395652c96841ba7636c4bd34c49b7c7b3a9ec')

package() {
    install -Dm755 "swaypwd-${pkgver}-x86_64" "$pkgdir/usr/bin/swaypwd"
    install -Dm644 "swaypwd-${pkgver}-man.1"  "$pkgdir/usr/share/man/man1/swaypwd.1"
    install -Dm644 LICENSE                    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
