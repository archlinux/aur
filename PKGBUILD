# Maintainer: Allen Li <darkfeline@felesatra.moe>
pkgname=python-pymysql-git
pkgver=r538.cda58f0
pkgrel=1
pkgdesc="Pure Python MySQL Client"
arch=(any)
url="https://github.com/petehunt/PyMySQL"
license=('MIT')
depends=('python')
makedepends=('git' 'python-distribute')
provides=('pymysql')
conflicts=('pymysql')
source=($pkgname'::git+https://github.com/petehunt/PyMySQL')
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir" --prefix=/usr
}
