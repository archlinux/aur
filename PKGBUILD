# Maintainer: Mike Pento <mjpento@gmail.com>
# Contributor: Xavier Benderitter <phenomenologeek at gmail.com>

pkgname=wmcpuload
pkgver=1.1.1
pkgrel=1
license=('GPL-2.0-only')
pkgdesc="A WindowMaker dockapp to monitor CPU usage"
url="https://www.dockapps.net/wmcpuload"
arch=(i686 x86_64)
depends=('glibc' 'libx11' 'libxext' 'libxpm')
options+=('!debug')
source=(https://www.dockapps.net/download/wmcpuload-1.1.1.tar.gz)
md5sums=('d8ab044256c7a1ee86fd31b566aa36b9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

