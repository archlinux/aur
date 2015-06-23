# Maintainer: Christoph Hoopmann <choopm at 0pointer.org>
# Contributor: Zsolt Udvari <udvzsolt@gmail.com>
pkgname=codeigniter
pkgver=3.0.0
pkgrel=1
pkgdesc="An object-oriented web-application framework for PHP projects"
arch=('any')
url="http://www.codeigniter.com"
license=('MIT')
depends=('php')
source=("codeigniter-create-project" "https://github.com/bcit-ci/CodeIgniter/archive/$pkgver.zip")

sha256sums=('3b7d8d8a6127916a86764015faf877fbc1fb7579552a749c619e8259b6afd061'
            '825d47859368ffa7eccc79c1fac6e095927b49b9ec2c3adb07d639765b724102')
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

