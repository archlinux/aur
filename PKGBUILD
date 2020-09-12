# Maintainer: Sauyon Lee <aur@sauyon.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Stunts <f.pinamartins@gmail.com>

pkgname=hangups
pkgver=0.4.11
pkgrel=1
pkgdesc='The first third-party instant messaging client for Google Hangouts'
arch=('any')
url=https://github.com/tdryer/hangups
license=('MIT')
depends=('python-aiohttp' 'python-appdirs' 'python-configargparse'
         'python-mechanicalsoup' 'python-protobuf' 'python-readlike'
         'python-reparser' 'python-requests' 'python-setuptools' 'python-urwid')
source=("https://files.pythonhosted.org/packages/source/h/hangups/hangups-$pkgver.tar.gz")
sha256sums=('db530cd7352c3fef4513bce38f07d19b79180b3aefed71afd9f369bab7cab498')

build() {
  cd hangups-$pkgver
  python setup.py build
}

package() {
  cd hangups-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/hangups LICENSE
}

# vim:set ts=2 sw=2 et:
