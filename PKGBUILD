# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Serkan Hosca <serkan@hosca.com>

pkgname=devpi-web
pkgver=4.0.7
pkgrel=2
pkgdesc="Web interface plugin for devpi-server"
arch=('any')
url="https://doc.devpi.net/"
license=('MIT')
groups=('devpi')
depends=(
  'devpi-server>=5.2.0'
  'devpi-common>=3.2.0'
  'python>=3.4'
  'python-beautifulsoup4>=4.3.2'
  'python-defusedxml'
  'python-docutils>=0.11'
  'python-pygments>=1.6'
  'python-pyramid>1.10'
  'python-readme-renderer>=23.0'
  'python-whoosh<3')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('6b56406af005551544333257ba9f49cb139fc9ce21d786572f017023a71c31c0')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:

