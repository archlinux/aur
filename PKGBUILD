# Maintainer: GrbavaCigla <alexa.ognjanovic at gmail dot com>
# Contributor: GrbavaCigla <alexa.ognjanovic at gmail dot com>
# Contributor: hawerner 
pkgname=pureref
pkgver=1.9.2
pkgrel=1
pkgdesc="Reference Image Viewer. A simple and lightweight reference image viewer whose purpose is to display images without any distractions such as buttons or frames, while still providing the most common image transformation tools."
arch=('x86_64')
url="http://www.pureref.com"
license=('')
makedepends=('curl')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.deb::https://www.pureref.com/files/installer.php?build=UNIX64.deb&downloadKey=$(curl https://www.pureref.com/download.php 2>/dev/null | grep var\ key | cut -d "\"" -f2 | cut -d "\"" -f1)")
sha512sums=('225c94dd06841222e6cef0806056b38a7f6ba2f29a719f5a886230cd51bcf227dd43a90f1e7d7c8da81327ef76f038364cf05c65edc0e1e57d132e4a7baa0a6d')

package(){
	cd $srcdir
	ar x "${pkgname}-${pkgver}.deb"
	tar xf data.tar.xz -C "${pkgdir}"
}
