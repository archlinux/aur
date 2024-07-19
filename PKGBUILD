# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=vot-cli
pkgver=1.4.1
pkgrel=1
pkgdesc="The voice-over translation of the video is now available not only in YandexBrowser."
arch=('x86_64' 'aarch64')
url="https://github.com/FOSWLY/vot-cli"
license=('MIT')
depends=('nodejs>=17')
makedepends=('npm')
source=(${pkgname}-${pkgver}.tgz::$url/archive/${pkgver}.tar.gz)
b2sums=('33a8be16f55671d9897d07690b21480dfe0eb1d0dd942dc981c0ee538ecf3ab52be3d7829846feca896d5bd955657096b9a60cb52368e35a0f4136432ea4c970')

package() {
	cd $pkgname-${pkgver}


	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" $pkgname@$_npmver
}
