# Maintainer: Matthias Braun <me@matthiasbraun.eu>
pkgname=way-magnitator-bin
pkgver=0.3.0
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
b2sums=('f0f99f81d43c4d17d9b6402d511391fa3db4765c5895fe9ce4688b0f5232519fb436cc46408447e57877b3670e2e641bb284f81c5aac7f466bf86c39f4266e26'
        'b6829320f725e3e45c4807ef5deb4738a691fb3ab146d8531b81fdbccd8376a826c8ec76165985cdf37d534f68e395652c96841ba7636c4bd34c49b7c7b3a9ec'
        '9fed4c9d8e7b82c5bc180e8b99f40261509c9580e2802fad6742257237ac94a3eb856240aae6fd0ab0db1467f09f9ef52b396309c8efa762fc641d5c0de520cd')

package() {
    install -Dm755 "way-magnitator-${pkgver}-x86_64" "$pkgdir/usr/bin/way-magnitator"
    install -Dm644 LICENSE                           "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 way-magnitator.1                  "$pkgdir/usr/share/man/man1/way-magnitator.1"
}
