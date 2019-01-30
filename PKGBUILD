# Maintainer: Icarus Mitchellson <mumei AT airmail DOT cc>

pkgname=root-tail
pkgrel=1
pkgver=1.2
pkgdesc='Displays a given file (stdin) anywhere on your X11 root window'
arch=('i686' 'x86_64' 'armv7h')
url='https://directory.fsf.org/wiki/Root-tail'
license=('GPL')
makedepends=('imake')
source=("http://oldhome.schmorp.de/marc/data/root-tail-1.2.tar.gz")
sha256sums=('08fb829cc0edd533aaf2af7bcf12d877a6ff51d60c59be48ba354c5940b80691')

build() {
  cd "$pkgname-$pkgver"
  xmkmf -a
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
