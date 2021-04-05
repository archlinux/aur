# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
pkgname=instamenu-extra
pkgver=2021.04.05
pkgrel=1
pkgdesc="addons for instamenu"
url="https://github.com/The-Repo-Club/$pkgname"
arch=('any')
groups=('therepoclub')
license=('CC BY-NC-SA 4.0')
depends=('bash' 'systemd' 'glib2' 'autorandr' 'instamenu' 'instamenu-schemas' 'python>=3.4' 'python-gobject' 'cutycapt')
provides=($pkgname)
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('fcbac833b0054bad8a97fad8eee9be66c15f417f70db1204da6219cfc522f453')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
