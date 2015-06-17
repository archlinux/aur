# Maintainer: M0Rf30
pkgname=cakephp
pkgver=1.3.20
pkgrel=1
pkgdesc='The Rapid Development Framework for PHP'
arch=('any')
url='http://cakephp.org/'
license=('MIT')
depends=('php')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/tarball/$pkgver"
        'cake.sh'
	'httpd-cakephp.conf')

package() {
    cd $srcdir/cakephp-cakephp-*
    install -D -m 644 "cake/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    mkdir -p $pkgdir/usr/share/webapps
    cp -R $srcdir/cakephp-cakephp-* "$pkgdir/usr/share/webapps/cakephp"
    install -D -m 755 "$srcdir/cake.sh" "$pkgdir/usr/bin/cake"
    install -D -m 755 "$srcdir/httpd-cakephp.conf" "$pkgdir/etc/webapps/cakephp/httpd-cakephp.conf"
    mkdir -p $pkgdir/var/log/httpd/cakephp
}

md5sums=('1ab70095945ddfe8cb2579141206ef72'
         'a3a711e2e32fe03976ed7737c22e0c56'
         'd206d584570dc1b740f0c9c252982f6c')
