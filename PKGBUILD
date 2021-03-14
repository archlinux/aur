# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
pkgname=instamenu-extra
pkgver=2021.03.14
pkgrel=1
pkgdesc="addons for instamenu"
url="https://github.com/The-Repo-Club/$pkgname"
arch=('any')
groups=('therepoclub')
license=('CC BY-NC-SA 4.0')
depends=('bash' 'systemd' 'glib2' 'autorandr' 'instamenu' 'instamenu-schemas' 'python>=3.4' 'python-gobject')
provides=($pkgname)
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('5eb8f3d81c9ede115018c15e9b63b257edf922ae07658a80d90047d5a92c1b5e')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
