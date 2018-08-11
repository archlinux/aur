# Maintainer: Jan Koppe <post@jankoppe.de>

pkgname=python-sdnotify
pkgver=0.3.2
pkgrel=1
pkgdesc="A pure Python implementation of systemd's service notification protocol (sd_notify)"
arch=('any')
url=https://github.com/bb4242/sdnotify
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/s/sdnotify/sdnotify-$pkgver.tar.gz")
sha512sums=('f7e7d38c8d7f56ebad8b0343361a0bf6177208b94916430343a0a392015622d7bb62aa391e17956e5aa9a0d7189c79268cb86c46bb52b36488df5aebca5cfbd3')

build() {
  cd sdnotify-$pkgver
  python setup.py build
}

package() {
  cd sdnotify-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/sdnotify/LICENSE
}

# vim:set ts=2 sw=2 et:
