# Maintainer: Alad Wenter <alad@archlinux.org>
# Contributor: John Jenkins twodopeshaggy@gmail.com
pkgname=rtv
pkgver=1.27.0
pkgrel=3
pkgdesc="Browse Reddit from your terminal"
arch=('any')
url="https://github.com/michael-lazar/rtv"
license=('custom:MIT')
makedepends=('python-setuptools')
depends=('python-beautifulsoup4' 'python-decorator' 'python-kitchen' 'python-six' 'python-requests')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c57a6cbb2525160b6aaa9180aec0293962b6969675f8ac0f2cfacff3cbd00d7c')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
