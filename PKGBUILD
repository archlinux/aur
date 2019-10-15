# Maintainer: GrbavaCigla <alexa.ognjanovic at gmail dot com>
# Contributor: GrbavaCigla <alexa.ognjanovic at gmail dot com>
# Contributor: hawerner 
pkgname=pureref
pkgver=1.9.2
pkgrel=5
pkgdesc="Reference Image Viewer"
arch=('x86_64')
url="http://www.pureref.com"
license=('unknown')
makedepends=('curl' 'libarchive' 'binutils')
source=("${pkgname}-${pkgver}.deb::https://www.pureref.com/files/installer.php?build=UNIX64.deb&downloadKey=$(curl https://www.pureref.com/download.php 2>/dev/null | grep var\ key | cut -d "\"" -f2 | cut -d "\"" -f1)")
sha512sums=('225c94dd06841222e6cef0806056b38a7f6ba2f29a719f5a886230cd51bcf227dd43a90f1e7d7c8da81327ef76f038364cf05c65edc0e1e57d132e4a7baa0a6d')

prepare(){
	ar x "${pkgname}-${pkgver}.deb"
}

package(){
	bsdtar xf data.tar.xz -C "${pkgdir}"
	chmod -R 755 "${pkgdir}"
}
