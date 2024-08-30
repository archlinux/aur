# Maintainer: loserMcloser <reebydobalina@gmail.com>

_pkgname=spotify-randomizer
pkgname=$_pkgname-git
pkgver=r9.960e0c0
pkgrel=1
pkgdesc='A simple python script to randomize Spotify playlists'
arch=('any')
url='https://github.com/loserMcloser/spotify-randomizer'
license=('MIT')
depends=('python' 'python-spotipy' 'python-platformdirs' 'python-yaml')
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm644 -t "$pkgdir/usr/share/man/man1" ${_pkgname}.1
    install -Dm755 -t "$pkgdir/usr/bin" $_pkgname
    install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/$_pkgname" config.yaml
}
