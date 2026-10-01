# Maintainer: Matthias Braun <me@matthiasbraun.eu>
pkgname=way-magnitator-bin
pkgver=0.2.0
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
b2sums=('3fe92c63c1563bb870c534fc4d3ccc245c31fca98490c83c59c7fd4db41ef675959d78ff1d26bd69950311d2087ca716f3ec1691cbc7b431a072ff9a7c94433a'
        'b6829320f725e3e45c4807ef5deb4738a691fb3ab146d8531b81fdbccd8376a826c8ec76165985cdf37d534f68e395652c96841ba7636c4bd34c49b7c7b3a9ec'
        'ac37bdff00503929869ad3c8eb95ba50424298f2fe5b5f5524bf2cc106031830f4f8b650d21937dacaf8c9a655e6f9d6d4a493801fdc533bf73e3c2fb3129b6a')

package() {
    install -Dm755 "way-magnitator-${pkgver}-x86_64" "$pkgdir/usr/bin/way-magnitator"
    install -Dm644 LICENSE                           "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 way-magnitator.1                  "$pkgdir/usr/share/man/man1/way-magnitator.1"
}
