# Maintainer: Matthias Braun <me@matthiasbraun.eu>
pkgname=way-magnitator-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Magnifies the screen area around the mouse cursor on Sway and other wlroots-based Wayland compositors"
arch=(x86_64)
url="https://gitlab.com/bullbytes/way-magnitator"
license=(AGPL-3.0-or-later)
depends=(libxkbcommon)
provides=(way-magnitator)
conflicts=(way-magnitator)
# The binary is already stripped by CI (see the project's .gitlab-ci.yml),
# so there's nothing left for makepkg to strip and no debug info to split
# into a -debug package.
options=('!strip' '!debug')
source=(
    "way-magnitator-${pkgver}-x86_64::https://gitlab.com/api/v4/projects/87137556/packages/generic/way-magnitator/${pkgver}/way-magnitator-x86_64"
    "LICENSE::https://gitlab.com/bullbytes/way-magnitator/-/raw/v${pkgver}/LICENSE"
    "way-magnitator.1::https://gitlab.com/bullbytes/way-magnitator/-/raw/v${pkgver}/man/way-magnitator.1"
)
b2sums=('062697f7808b6908fc88d08b7f27e65b48d1eb783ae1f8f6561e2d11b754302b0167733080cc1aa52962b73f734d2ce697bbd0e047e0ce18630ab2b058664663'
        'b6829320f725e3e45c4807ef5deb4738a691fb3ab146d8531b81fdbccd8376a826c8ec76165985cdf37d534f68e395652c96841ba7636c4bd34c49b7c7b3a9ec'
        '078971a738c5e0f572de1ffd35d2e624fe287e88afd0c239593e341518c96fcf8946c4fb6b8b88f44ca3317ebc32fe792038a6302ef767ed28f75d6c72baf74b')

package() {
    install -Dm755 "way-magnitator-${pkgver}-x86_64" "$pkgdir/usr/bin/way-magnitator"
    install -Dm644 LICENSE                           "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 way-magnitator.1                  "$pkgdir/usr/share/man/man1/way-magnitator.1"
}
