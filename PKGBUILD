# Maintainer: Jay Ta'ala <jay@jaytaala.com>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Florent H. CARRÉ <colundrum@gmail.com>

pkgname=skippy-xd-git
pkgver=v2016.10.20.28.g1e98b2f
pkgrel=1
pkgdesc="A full-screen task-switcher for X11, similar to Apple's Expose."
arch=("i686" "x86_64")
url="https://github.com/dreamcat4/skippy-xd"
license=("GPL")
depends=("giflib" "libjpeg" "libxcomposite" "libxft" "libxinerama" "xorg-server")
makedepends=("git")
provides=("skippy-xd")
conflicts=("skippy-xd")
source=("${pkgname}::git+https://github.com/dreamcat4/skippy-xd.git#branch=master")
sha256sums=("SKIP")

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --tags | sed 's/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}
