# Maintainer: Evan Edwards <evan@ejedev.com>

pkgname=python-cloudcheck
pkgver=7.0.47
pkgrel=1
pkgdesc="Check whether an IP address or hostname belongs to popular cloud providers"
url="https://github.com/blacklanternsecurity/cloudcheck"
license=('GPL-3.0')
arch=('any')
depends=('python' 'python-httpx' 'python-pydantic' 'python-regex' 'python-radixtarget')
makedepends=('python-poetry' 'python-installer')
source=("https://files.pythonhosted.org/packages/bf/8a/58f1df20c4e59936df7a3bb62a6ea1eeae7ffe87996224b64b4e531b7d90/cloudcheck-7.0.47.tar.gz")
sha256sums=('61c4a3b70dcd86349c72e3179e427e7db6ee046cc88ba0d76ada1bea84223242')

build() {
  cd cloudcheck-$pkgver
  python -m poetry build
}

package() {
  cd cloudcheck-$pkgver
  python -m installer --destdir="$pkgdir" dist/cloudcheck-$pkgver-py3-none-any.whl
}
