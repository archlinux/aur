# Maintainer: BoBeR182 <aur AT nullvoid DOT com>

pkgname=noodle-gallery
pkgver=5.7.0
pkgrel=1
pkgdesc='Self-hosted photo and video management solution, deployed via Docker Compose'
arch=('any')
url='https://github.com/open-noodle/gallery'
license=('AGPL-3.0-only')
depends=('docker' 'docker-compose')
install="$pkgname.install"
source=("https://github.com/open-noodle/gallery/releases/download/v${pkgver}/docker-compose.yml"
        "https://github.com/open-noodle/gallery/releases/download/v${pkgver}/example.env"
        "https://raw.githubusercontent.com/open-noodle/gallery/v${pkgver}/LICENSE"
        "${pkgname}.service"
        "${pkgname}.install")
sha256sums=('76804f31d768eeeea8f64b409a80383057501bc3c0ea8e7796d4bdfaf45ee5bd'
            '05dfd47bdd31eb8a42a62f9d37d6436388439c9ab815e166c54b85c0906231b2'
            'a3bad629f67f442b23b5224419e49edafc32e6b9c876b89464f7aafe6091ccde'
            'ee229ca53c4e645341eece70b7fc61fc69ea62956c3266f11c32b17ef58bd50f'
            '5c7a889350ac52649f0049a3e07a0c1953c04a8d7f65f69105b97e2357bd6002')

package() {
  install -Dm644 "$srcdir/docker-compose.yml" "$pkgdir/usr/share/$pkgname/docker-compose.yml"
  install -Dm644 "$srcdir/example.env" "$pkgdir/usr/share/$pkgname/$pkgname.env.example"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}