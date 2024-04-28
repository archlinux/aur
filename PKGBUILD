# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=vot-cli
pkgver=1.4.0
pkgrel=1
pkgdesc="The voice-over translation of the video is now available not only in YandexBrowser."
arch=('x86_64' 'aarch64')
url="https://github.com/FOSWLY/vot-cli"
license=('MIT')
depends=('nodejs>=17')
makedepends=('npm')
source=(${pkgname}-${pkgver}.tgz::$url/archive/${pkgver}.tar.gz)
b2sums=('bea5268e38c393264bf9f1889221c114fa70673d824d6be122c715cc876ff2b7a9a72e7bc3afaeaaae19a5e05920c97bcb4da3922350f2f69f74f788e25c9eed')

package() {
	cd $pkgname-${pkgver}


	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" $pkgname@$_npmver
}
