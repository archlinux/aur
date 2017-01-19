# Maintainer: Arno Dubois <arno /dot\ du /at\ orange /dot\ fr>
# Contributor: Chris Kelly <https://ckdake.com/content/2016/certbot-and-cloudflare.html>


pkgname=cloudflare-le
pkgver=1
pkgrel=1
pkgdesc="Renew Let's Encrypt SSL with Full (Strict) SSL and no webroot possibility"
arch=('any')
url="https://ckdake.com/content/2016/certbot-and-cloudflare.html"
license=('unknown')
depends=('jq')
optdepends=("certbot: the default Let's Encrypt client")
source=("$pkgname-$pkgver.tar.gz")
md5sums=('d6c75c49165370ff49423eed9805fa13')
install=$pkgname.install

package() {
        cd "$srcdir"
		mkdir -p $pkgdir/etc/
		mkdir -p $pkgdir/etc/cloudflare-le/
		cp cloudflare.conf $pkgdir/etc/cloudflare-le/
		mkdir -p $pkgdir/usr
		mkdir -p $pkgdir/usr/lib/
		mkdir -p $pkgdir/usr/lib/cloudflare-le/
		cp * $pkgdir/usr/lib/cloudflare-le/
		rm $pkgdir/usr/lib/cloudflare-le/$pkgname-$pkgver.tar.gz
		rm $pkgdir/usr/lib/cloudflare-le/cloudflare.conf
}