# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=yawsso
pkgver=1.0.0
pkgrel=1
pkgdesc="Yet Another AWS SSO - sync up AWS CLI v2 SSO login session to legacy CLI v1 credentials"
arch=("any")
url=https://github.com/victorskl/yawsso
license=("MIT")
makedepends=("python-setuptools")
depends=("python-pyperclip")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('c418f5c0e8cee1263707a6c80d5564fe270b2eb87fdf0317f2ed9d62d2292a2c')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
