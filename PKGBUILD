# Maintainer: Matthias Braun <me@matthiasbraun.eu>
pkgname=swaypwd-bin
pkgver=0.1.4
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
b2sums=('a7f5685146cd0df0a0cb175349ecb237e91424616246548e1187de01fb0898dd60051019656d164adc02432bc78d432438fb40a59ec6c570d3cee59ac3154a77'
        'bfddcf30f926291138d9cf4f8cce610bd09178d5f319f9bb57d478d17f63ac04ae9a0ca492622c1880b4fcf73f4e84db8d9728fbe146b630ce641dc7f0e63fb9'
        'b6829320f725e3e45c4807ef5deb4738a691fb3ab146d8531b81fdbccd8376a826c8ec76165985cdf37d534f68e395652c96841ba7636c4bd34c49b7c7b3a9ec')

package() {
    install -Dm755 swaypwd-x86_64  "$pkgdir/usr/bin/swaypwd"
    install -Dm644 swaypwd.1       "$pkgdir/usr/share/man/man1/swaypwd.1"
    install -Dm644 LICENSE         "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
