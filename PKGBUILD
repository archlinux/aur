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
sha256sums=('2dc2ec78a0fc79f0200b0df2b257c8defc4fb820dd6fb176cab406884f7ec7e8')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

