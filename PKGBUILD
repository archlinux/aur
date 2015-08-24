# Maintainer: Christoph Hoopmann <choopm at 0pointer.org>
# Contributor: Zsolt Udvari <udvzsolt@gmail.com>
pkgname=codeigniter
pkgver=3.0.1
pkgrel=1
pkgdesc="An object-oriented web-application framework for PHP projects"
arch=('any')
url="http://www.codeigniter.com"
license=('MIT')
depends=('php')
source=("codeigniter-create-project" "https://github.com/bcit-ci/CodeIgniter/archive/$pkgver.zip")

sha256sums=('b938a7c8f789402f0f97f2a18ce54d2cc9e7f89837d5c7b4e678a1ac1668b56b'
            '9f0506dbcba57973b18437df6058ad2a2dd6feef5ae2a360015afddccaa9fd76')
build() {
    true
}

package() {
    cd "$srcdir/CodeIgniter-$pkgver/"
    install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -d "$pkgdir/usr/share/pear/$pkgname"
    cp -R index.php application system "$pkgdir/usr/share/pear/$pkgname"
    install -d "$pkgdir/usr/share/doc/$pkgname"
    cp -R user_guide/* "$pkgdir/usr/share/doc/$pkgname"
    find $pkgdir/usr/share -type f -exec chmod -x {} \;
    install -d "$pkgdir/usr/bin"
    install -Dm755 ../codeigniter-create-project "$pkgdir/usr/bin"
}

