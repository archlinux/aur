# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
# shellcheck disable=all

pkgname=shellfetch
pkgver=2022.09.19
pkgrel=1
pkgdesc="Shell System Information Fetcher"
arch=('any')
groups=('linuxrepos')
url="https://github.com/The-Repo-Club/$pkgname"
license=('MIT')
depends=('bash' 'xorg-xrandr' 'figlet' 'ncurses')
makedepends=('git')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('35e40b43c4d1f1b75b48cfa5f48fb666c9ded512c0eb8c0b6111f8150e8017da')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
