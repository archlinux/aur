# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-waitress
pkgver=2.1.2
pkgrel=1
pkgdesc="Waitress WSGI server"
arch=('any')
license=('ZPL')
url="https://github.com/Pylons/waitress"
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest-cov' 'python38-pytest-runner')
source=("https://github.com/Pylons/waitress/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('b27d1f6f9969299e3986604c6d95e130f35772c4f687c1b9b31a3a29b77330fda1c9d0ddfc640963c2bf25173ce2fcf734464ec2400afee77ec605767700208c')

build() {
  cd waitress-$pkgver
  python3.8 setup.py build
}

check() {
  cd waitress-$pkgver
  python3.8 setup.py pytest
}

package_python38-waitress() {
  cd waitress-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}
