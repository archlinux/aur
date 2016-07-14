# Maintainer: Roland Singer <roland.singer@desertbit.com>
# Upstream URL: https://github.com/pez2001/razer_chroma_drivers

pkgname=razer_chroma_drivers-git
pkgver=20160714
pkgrel=1
pkgdesc='A collection of Linux drivers for Razer Chroma devices, it supports all lighting modes and includes a daemon for advanced effects + gui configuration app.'
arch=('x86_64' 'i686')
url='https://github.com/pez2001/razer_chroma_drivers'
license=('GPLv2')
depends=('libdbus' 'jq' 'python')
makedepends=('git' 'linux-headers')
source=("git+https://github.com/pez2001/razer_chroma_drivers.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/razer_chroma_drivers"
  make -s all
}

package() {
  cd "$srcdir/razer_chroma_drivers"
  make -s DESTDIR="$pkgdir" fedora_install
}
