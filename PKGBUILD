# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=feathers-cli
pkgver=4.8.0
pkgrel=1
pkgdesc="The command line interface for scaffolding Feathers applications"
arch=('any')
url='https://github.com/feathersjs/cli'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=('1d1d0f274de51a2cea3e4224e4f8a6bacc94e9f1719b2c18c2d2af43d353549e')

package() {
	export NODE_ENV=production
	npm install -g --cache npm-cache --prefix "$pkgdir/usr" "$pkgname-$pkgver.tar.gz"
	chown -R root:root "$pkgdir/"
}
