# Maintainer: hertg <aur@her.tg>
# This file is generated automatically
_version=0.18.2
_versionWithoutPrefix=0.18.2
_pkgname=egpu-switcher
_pkgver=0.18.2
_source=${_pkgname}-${_version}::https://github.com/hertg/egpu-switcher/archive/refs/tags/0.18.2.tar.gz
pkgname=$_pkgname
pkgver=$_pkgver
pkgdesc='Automatically detect and use eGPU on startup'
pkgrel=1
arch=(x86_64)
license=('GPL')
url='https://github.com/hertg/egpu-switcher'
makedepends=('go')
provides=(egpu-switcher)
conflicts=(egpu-switcher)
install=${pkgname}.install
source=($_source)
sha256sums=('SKIP')

# NOTE: github will strip the 'v' prefix from the tag when
# creating the source tarball, see https://stackoverflow.com/a/5796902

build() {
  cd "$srcdir/$pkgname-$_versionWithoutPrefix"
	make VERSION="$_version" ORIGIN="aur" build -s
}

package() {
  cd "$srcdir/$pkgname-$_versionWithoutPrefix"
	make DESTDIR="$pkgdir/" install -s
}
