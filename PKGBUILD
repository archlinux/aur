# Maintainer: Oliver Ford <dev.aur@ojford.com>
# shellcheck disable=SC2034,SC2154
pkgname=polybar-spotify
pkgver=20200619_b5c59238a17180affae5232c234175524a17d1c4
pkgrel=3
pkgdesc='Spotify now-playing info in polybar'
url='https://github.com/Jvanrhijn/polybar-spotify'
license=('MIT')
ref="${pkgver:9}"
source=("${url}/archive/${ref}.zip")
md5sums=('815b25c418611c58370733479bd2b504')
arch=('any')
depends=(
    'python'
    'python-dbus'
    'spotify'
)
optdepends=(
)
conflicts=(
)

package() {
    set -e
    cd "$pkgname-$ref"

    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    mkdir -p "$pkgdir/usr/bin"
    install -D -m755 "./spotify_status.py" "$pkgdir/usr/bin/$pkgname"
}
