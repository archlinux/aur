# Maintainer: aksr <aksr at t-com dot me>
pkgname=vimb2
pkgver=2.12
pkgrel=1
pkgdesc="A Vim-like web browser that is inspired by Pentadactyl and Vimprobable."
arch=('i686' 'x86_64')
url="http://fanglingsu.github.io/vimb"
license=('GPLv3')
depends=('webkitgtk>=1.5.0' 'libsoup>=2.38')
provides=('vimb')
conflicts=('vimb' 'vimb-git')
source=("https://github.com/fanglingsu/${pkgname%2}/archive/${pkgver}.tar.gz")
md5sums=('fadbbfb68125700ee4f9be5f98601fcf')
sha1sums=('57212aa4c283ad275a4dc3d2ecec7d4c4ae688d4')
sha256sums=('2443a27d625ff2a7aa7e7b694ec853e25dbdcb33b7c681c98c8fe81b1833b0b7')

build() {
  cd "$srcdir/${pkgname%2}-$pkgver"
  make
}

package() {
  cd "$srcdir/${pkgname%2}-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

