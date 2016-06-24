# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=argparser-java
pkgver=5.1
pkgrel=1
pkgdesc="Command line argument parser library, like getopt, except better. Java version"
arch=('any')
url="https://github.com/maandree/argparser"
license=('AGPL3')
makedepends=('coreutils' 'sed' 'java-environment')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('10cbff3d7c17d5c8e99dab20e5b425e1da7625dd4090d6c904c944b8bb64195f')


build() {
	cd "${srcdir}/argparser-${pkgver}"
	make DESTDIR="$pkgdir" PKGNAME="$pkgname" java
}

package() {
	cd "${srcdir}/argparser-${pkgver}"
	make DESTDIR="$pkgdir" PKGNAME="$pkgname" install-java install-license
}

