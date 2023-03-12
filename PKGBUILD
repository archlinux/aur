# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=yawsso
pkgver=1.1.0
pkgrel=1
pkgdesc="Yet Another AWS SSO - sync up AWS CLI v2 SSO login session to legacy CLI v1 credentials"
arch=("any")
url=https://github.com/victorskl/yawsso
license=("custom:MIT")
makedepends=("python-setuptools")
depends=("python-pyperclip")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('199dab543a57bed015bc39d910f8e44f526a5746b7301f488b11ba1778c82080')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
