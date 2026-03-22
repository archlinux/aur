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
source=(
    "swaypwd-x86_64::https://gitlab.com/bullbytes/swaypwd/-/packages/generic/swaypwd/${pkgver}/swaypwd-x86_64"
    "swaypwd.1::https://gitlab.com/bullbytes/swaypwd/-/packages/generic/swaypwd/${pkgver}/swaypwd.1"
    "LICENSE::https://gitlab.com/bullbytes/swaypwd/-/raw/main/LICENSE"
)
b2sums=(SKIP SKIP SKIP)

package() {
    install -Dm755 swaypwd-x86_64  "$pkgdir/usr/bin/swaypwd"
    install -Dm644 swaypwd.1       "$pkgdir/usr/share/man/man1/swaypwd.1"
    install -Dm644 LICENSE         "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
