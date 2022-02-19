# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
# shellcheck disable=all

pkgname=shellfetch
pkgver=2022.02.19
pkgrel=1
pkgdesc="Shell System Information Fetcher"
arch=('any')
groups=('therepoclub')
url="https://github.com/The-Repo-Club/$pkgname"
license=('MIT')
depends=('bash' 'xorg-xrandr' 'figlet' 'ncurses')
makedepends=('git')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('8ccb32af3d73ac39e51840b6bca551b18d858692202533743f2f3f39f878073c')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
