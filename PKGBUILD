# Maintainer: Gleb Liutsko <gleb@liutsko.ru>

pkgname=mssql-scripter
pkgver=1.0.0a23
pkgrel=1
pkgdesc='Command line experience for scripting SQL Server databases.'
url='https://github.com/microsoft/mssql-scripter'
license=('MIT')

arch=('any')
depends=('python' 'openssl-1.0')
makedepends=('python-setuptools')

source=("https://github.com/microsoft/${pkgname}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('7e673e01442b39a06b3ccb9f72eb7659549f0a822b0927451ce610102382c83a')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1

    rm -v "$pkgdir/usr/bin/mssql-scripter.bat"
}
