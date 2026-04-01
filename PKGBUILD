# Maintainer: mb <mb@example.com>
pkgname=swaypwd-bin
pkgver=0.1.2
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
b2sums=('d56b9a8e2468cdb1ff95c5310e7f9b8ebd30f12b0b6d39df89a078ef51d2f84c1ca9afe7ab9b3f0a7efc130636c52db95d71dbcfccd0855a79000e1ca78f25a8'
        'f1850822065a05a6c2e53dd92ad70f5676201f99248393f0237dad43c7f561839f4042bc32c3f0a6b804083696ccc50853fcceb1e7ee96caf4cef813862565e9'
        'b6829320f725e3e45c4807ef5deb4738a691fb3ab146d8531b81fdbccd8376a826c8ec76165985cdf37d534f68e395652c96841ba7636c4bd34c49b7c7b3a9ec')

package() {
    install -Dm755 swaypwd-x86_64  "$pkgdir/usr/bin/swaypwd"
    install -Dm644 swaypwd.1       "$pkgdir/usr/share/man/man1/swaypwd.1"
    install -Dm644 LICENSE         "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
