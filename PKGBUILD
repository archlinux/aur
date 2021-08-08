# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=devpi-client
pkgver=5.2.2
pkgrel=1
pkgdesc="Workflow commands for Python developers"
arch=('any')
url="https://doc.devpi.net/"
license=('MIT')
depends=(
  'check-manifest>=0.28'
  'devpi-common>=3.6.0'
  'devpi-common<4'
  'python>=3.4'
  'python-pkginfo>=1.4.2'
  'python-pluggy>=0.6.0'
  'python-pluggy<1.0.0'
  'python-py>=1.4.31'
  'python-tox>=3.1.0'
  'python-tox<4')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('24ac6d94108996efad4ff5185dabb1e5120ae238134b8175d6de2ca9e766cd92')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
