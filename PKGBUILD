# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=picker
pkgver=2021.01.20
pkgrel=1
pkgdesc="Bash wrapper for pacman and aur"
url="https://github.com/TheCynicalTeam/$pkgname"
arch=('any')
license=('CC BY-NC-SA 4.0')
depends=('grep' 'sed' 'bash' 'curl' 'pacman' 'jshon' 'expac')
provides=($pkgname)
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('6a53e502a8ea2a0dd2d858e58926fba0342d9a5112add845e759120de61ec202')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

