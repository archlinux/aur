# Maintainer: <mumei AT airmail DOT cc>

pkgname=root-tail
pkgrel=1
pkgver=1.3
pkgdesc='Displays a given file (stdin) anywhere on your X11 root window'
arch=('i686' 'x86_64' 'armv7h')
url='http://software.schmorp.de/pkg/root-tail.html'
#url='https://directory.fsf.org/wiki/Root-tail'
license=('GPL')
makedepends=('imake')
source=("http://dist.schmorp.de/root-tail/root-tail-1.3.tar.gz")
sha256sums=('460475323404460919ff48c90f7b3ebfdb66f3b9961f54dd73dd172178c07712')

build() {
  cd "$pkgname-$pkgver"
  xmkmf -a
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
