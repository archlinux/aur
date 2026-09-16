# Maintainer: Matthias Braun <me@matthiasbraun.eu>
pkgname=swaypwd-bin
pkgver=0.2.5
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
b2sums=('e7c5f46d22b3a430f0b4a5375419285f25caa4c6a7a58400d286b7395188a05be8a1b9867401c2bfd5cb567041452721af97ad9cbeeea8b057beb27978cc62e4'
        '12fbccc2d449d17a682b1462a56f25504e5d1aae77199445aed3e3774755b4eb29404dc76dd5a0e0c0c4692d83f85834461f481dd4235a74179a0538e97475bc'
        'b6829320f725e3e45c4807ef5deb4738a691fb3ab146d8531b81fdbccd8376a826c8ec76165985cdf37d534f68e395652c96841ba7636c4bd34c49b7c7b3a9ec')

package() {
    install -Dm755 "swaypwd-${pkgver}-x86_64" "$pkgdir/usr/bin/swaypwd"
    install -Dm644 "swaypwd-${pkgver}-man.1"  "$pkgdir/usr/share/man/man1/swaypwd.1"
    install -Dm644 LICENSE                    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
