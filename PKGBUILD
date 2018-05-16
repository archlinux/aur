# Maintainer: Joseph R. Quinn <quinn period josephr at protonmail dot com>
pkgname=nginx-h5bp-server-configs
_pkgname=server-configs-nginx
pkgver=2.0.0
pkgrel=1
pkgdesc="Nginx HTTP server boilerplate configs"
arch=('any')
url="https://github.com/h5bp/server-configs-nginx"
license=('MIT')
depends=('nginx')
provides=("$pkgname")
source=("https://github.com/h5bp/server-configs-nginx/archive/$pkgver.tar.gz")
sha1sums=('674b8084df61f72404ecedc2685c4267b7f17442')

prepare() {
	cd "$_pkgname-$pkgver"
	rm h5bp/README.md
}

package() {
	cd "$_pkgname-$pkgver"
	install -d "$pkgdir/etc/nginx/"
	mv h5bp "$pkgdir/etc/nginx/"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
