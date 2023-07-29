# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
# shellcheck disable=all

pkgname=shellfetch
pkgver=2023.07.29
pkgrel=1
pkgdesc="Shell System Information Fetcher"
arch=('any')
groups=('linuxrepos')
url="https://github.com/The-Repo-Club/$pkgname"
license=('MIT')
depends=('bash' 'xorg-xrandr' 'figlet' 'ncurses')
makedepends=('git')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('9b8ce1a271e588b0817ceb3c8e3c47000f1c5a659a6edd2daf99dfb097057ed4')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
