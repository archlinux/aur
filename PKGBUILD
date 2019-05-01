# Maintainer: Joseph R. Quinn <quinn period josephr at protonmail dot com>
pkgname=nginx-h5bp-server-configs
_pkgname=server-configs-nginx
pkgver=3.0.1
pkgrel=1
pkgdesc="Nginx HTTP server boilerplate configs"
arch=('any')
url="https://github.com/h5bp/server-configs-nginx"
license=('MIT')
depends=('nginx')
provides=("$pkgname")
install='.install'
source=("https://github.com/h5bp/server-configs-nginx/archive/$pkgver.tar.gz")
sha1sums=('7f3c0d396093d2c1365a5550a89c7f49cece5068')
backup=('etc/nginx/nginx.conf')

package() {
	cd "$_pkgname-$pkgver"
	install -d "$pkgdir/etc/nginx/"
	mv conf.d "$pkgdir/etc/nginx/"
	mv h5bp "$pkgdir/etc/nginx/"
	install -Dm755 mime.types "$pkgdir/etc/nginx/h5bp.mime.types"
	install -Dm755 nginx.conf "$pkgdir/etc/nginx/nginx.conf.example"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
