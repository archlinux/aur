# Maintainer: Matthias Braun <me@matthiasbraun.eu>
pkgname=swaypwd-bin
pkgver=0.2.7
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
b2sums=('019bc05556a96b5e753e034ee58f3457954cbfbd6ff64e297fb9ce81151175e8b8e80a1c496dbe91789ccef514d8d579dbeba72f154a90e9eea5c8f2b8caa462'
        'd930a448c39c1df1690c67848a89e22f84519dfc3ad00e850334b7716795452901d0810ed3ea0b0e74f5071268adcbd8b0a02b12bbba2ff6668911c948899724'
        'b6829320f725e3e45c4807ef5deb4738a691fb3ab146d8531b81fdbccd8376a826c8ec76165985cdf37d534f68e395652c96841ba7636c4bd34c49b7c7b3a9ec')

package() {
    install -Dm755 "swaypwd-${pkgver}-x86_64" "$pkgdir/usr/bin/swaypwd"
    install -Dm644 "swaypwd-${pkgver}-man.1"  "$pkgdir/usr/share/man/man1/swaypwd.1"
    install -Dm644 LICENSE                    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
