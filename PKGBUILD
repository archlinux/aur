# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: archdaemon
# Contributor: sekret
# Contributor: qubidt

pkgname=untrunc-git
pkgver=r388.d286625
pkgrel=1
pkgdesc="Utility to restore a damaged (truncated) mp4, m4v, mov, 3gp video"
arch=('x86_64')
conflicts=('untrunc')
url="https://github.com/anthwlock/untrunc"
license=('GPL-2.0-only')
depends=('libvdpau' 'zlib' 'bzip2')
makedepends=('yasm' 'git' 'libx11')
source=("${pkgname}"::'git+https://github.com/anthwlock/untrunc.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$pkgname
  make
} 

package() {
  install -Dm755 ${srcdir}/${pkgname}/untrunc ${pkgdir}/usr/bin/untrunc
}
