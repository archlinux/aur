# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=vot-cli
pkgver=1.2.1
pkgrel=1
pkgdesc="The voice-over translation of the video is now available not only in YandexBrowser."
arch=('x86_64' 'aarch64')
url="https://github.com/FOSWLY/vot-cli"
license=('MIT')
depends=('nodejs>=17')
makedepends=('npm')
source=(${pkgname}-${pkgver}.tgz::$url/archive/${pkgver}.tar.gz)
b2sums=('e51f9b1e42caad9ce3ccb0cd599bdccbfe45fd99fa24410a2023d3fcf1b0800d90eec02da92736e77ddbdb6978f3a6cbba100f6b2cfb93368e57dc1d04bad986')

package() {
	cd $pkgname-${pkgver}


	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" $pkgname@$_npmver
}
