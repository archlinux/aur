# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=picker
pkgver=2020.12.28
pkgrel=1
pkgdesc="Bash wrapper for pacman and aur"
url="https://github.com/TheCynicalTeam/$pkgname"
arch=('any')
license=('GNU General Public License v3.0')
depends=('grep' 'sed' 'bash' 'curl' 'pacman' 'jshon' 'expac')
provides=($pkgname)
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('3d1c9a367779fdcf19bfaf82055e8cc97ef0b89db014d65331afc6397f246d10')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

