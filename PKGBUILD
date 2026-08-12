# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=yawsso
pkgver=1.4.0
pkgrel=1
pkgdesc="Yet Another AWS SSO - sync up AWS CLI v2 SSO login session to legacy CLI v1 credentials"
arch=("any")
url=https://github.com/victorskl/yawsso
license=("MIT")
makedepends=("python-setuptools")
depends=("python-pyperclip")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('c858cf3feb5595ce516d00ff3e23f534e08f1a5a218f134f7180b2de2a044083')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
