# Maintainer: mb <mb@example.com>
pkgname=swaypwd-bin
pkgver=0.1.0
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
    "swaypwd-x86_64::https://gitlab.com/api/v4/projects/80488692/packages/generic/swaypwd/${pkgver}/swaypwd-x86_64"
    "swaypwd.1::https://gitlab.com/api/v4/projects/80488692/packages/generic/swaypwd/${pkgver}/swaypwd.1"
    "LICENSE::https://gitlab.com/bullbytes/swaypwd/-/raw/v${pkgver}/LICENSE"
)
b2sums=('6d44a8cf10402bf8c1d634ea05085d23e0becb678c34d5a87a0906672e071fa0b69fe2bac0fdb5f52fce3e91a3a28dc1da53aa29b72c0e9b864b89e8131a0209'
        '3af0f03dd8eb7cbcd5fd207802523cb4cb6da2728beee8fb368939f3518fa5dc72e5648c923934346ec8306487c93a387c5d1d3456a73cd718ec21911eed0c90'
        'b6829320f725e3e45c4807ef5deb4738a691fb3ab146d8531b81fdbccd8376a826c8ec76165985cdf37d534f68e395652c96841ba7636c4bd34c49b7c7b3a9ec')

package() {
    install -Dm755 swaypwd-x86_64  "$pkgdir/usr/bin/swaypwd"
    install -Dm644 swaypwd.1       "$pkgdir/usr/share/man/man1/swaypwd.1"
    install -Dm644 LICENSE         "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
