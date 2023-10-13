# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=vot-cli
pkgver=1.1.1
pkgrel=1
pkgdesc="The voice-over translation of the video is now available not only in YandexBrowser."
arch=('x86_64' 'aarch64')
url="https://github.com/FOSWLY/vot-cli"
license=('MIT')
depends=('nodejs>=17')
makedepends=('npm')
source=(${pkgname}-${pkgver}.tgz::$url/archive/${pkgver}.tar.gz)
b2sums=('a3aed0a2431855e2e9cb87f40c3884b33b5fa491809f5c8632947c87bd6e968fe7ccd4455bcf2c247d761d3714c6c7f22b6844736d8b5f087a8595a3851809bf')

package() {
	cd $pkgname-${pkgver}


	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" $pkgname@$_npmver
}
