# Maintainer: Matthias Braun <me@matthiasbraun.eu>
pkgname=swaypwd-bin
pkgver=0.2.8
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
b2sums=('b78c5d2f150ce80fb1bf60ac844aaedddd9dbfbc8568d3ea58b8b7db237345050f1b1aaf0e9313697e4ae1156b2143b6bab4c0c3ceef2ccd555c50f6716664ce'
        'd3f6492e202e4e1bdb0491949f3d4b9ca60432768006276acabd5321476b59c41859062172e1c5f714294a0663d2d13f71662172e03e7d1f6845e77b8e306d07'
        'b6829320f725e3e45c4807ef5deb4738a691fb3ab146d8531b81fdbccd8376a826c8ec76165985cdf37d534f68e395652c96841ba7636c4bd34c49b7c7b3a9ec')

package() {
    install -Dm755 "swaypwd-${pkgver}-x86_64" "$pkgdir/usr/bin/swaypwd"
    install -Dm644 "swaypwd-${pkgver}-man.1"  "$pkgdir/usr/share/man/man1/swaypwd.1"
    install -Dm644 LICENSE                    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
