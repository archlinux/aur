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
b2sums=('ac9f82d0f133e2c52bb61e6db6b565fb7de0ad85fbdfeb7110be4a412197e1550d70c32a52428be4d3a8ff42a4594799dc0dfe4b7616e43c9ee07d245761eff5'
        '31e883a435d495f38df96303ffb2d3b7ae20803a58e60a6d03e588f217dee6fafbd419e93eb082dfee0ef4c18d59f9d295e92979d218ccbba2b5b085fc586852'
        'b6829320f725e3e45c4807ef5deb4738a691fb3ab146d8531b81fdbccd8376a826c8ec76165985cdf37d534f68e395652c96841ba7636c4bd34c49b7c7b3a9ec')

package() {
    install -Dm755 swaypwd-x86_64  "$pkgdir/usr/bin/swaypwd"
    install -Dm644 swaypwd.1       "$pkgdir/usr/share/man/man1/swaypwd.1"
    install -Dm644 LICENSE         "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
