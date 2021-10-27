# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=feathers-cli
pkgver=4.5.0
pkgrel=1
pkgdesc="The command line interface for scaffolding Feathers applications"
arch=('any')
url='https://github.com/feathersjs/cli'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=('f6789f4adaf4afde4971e50e8464c14dec2f1406c15e050ecc4cf5ebb83b015c')

package() {
	export NODE_ENV=production
	npm install -g --cache npm-cache --prefix "$pkgdir/usr" "$pkgname-$pkgver.tar.gz"
	chown -R root:root "$pkgdir/"
}
