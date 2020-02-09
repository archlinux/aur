# Maintainer: robertfoster
pkgname=cakephp
pkgver=4.0.3
pkgrel=1
pkgdesc='The Rapid Development Framework for PHP'
arch=('any')
url='http://cakephp.org/'
license=('MIT')
depends=('php')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/tarball/$pkgver"
        'cake.sh'
	'httpd-cakephp.conf')
md5sums=('ba5308c383a9cec49d003b63da71c6c1'
         'a3a711e2e32fe03976ed7737c22e0c56'
         'd206d584570dc1b740f0c9c252982f6c')
package() {
    cd $srcdir/cakephp-cakephp-*
    mkdir -p $pkgdir/usr/share/webapps
    cp -R $srcdir/cakephp-cakephp-* "$pkgdir/usr/share/webapps/cakephp"
    install -D -m 755 "$srcdir/cake.sh" "$pkgdir/usr/bin/cake"
    install -D -m 755 "$srcdir/httpd-cakephp.conf" "$pkgdir/etc/webapps/cakephp/httpd-cakephp.conf"
    mkdir -p $pkgdir/var/log/httpd/cakephp
}
