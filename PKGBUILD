# Maintainer liganic <aur@replace-this-with-my-username.com>
# Contributor: Jan Koppe <post@jankoppe.de>

pkgname=python-sdnotify
pkgver=0.3.3
pkgrel=2
pkgdesc="A pure Python implementation of systemd's service notification protocol (sd_notify)"
arch=('any')
url=https://github.com/Liganic/python-sdnotify
license=('MIT')
depends=('python')
makedepends=(python-build python-installer python-wheel)
source=("git+https://git@github.com/Liganic/python-sdnotify.git")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --abbrev=0 --tags | cut -c2-
}

build() {
    cd $pkgname
    python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
