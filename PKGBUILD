# Maintainer: <mumei AT airmail DOT cc>

_pkgname=DictionaryReader
pkgname=dictionaryreader.app
pkgrel=1
pkgver=20160621
pkgdesc='Dictionary application that queries Dict servers in the internet to let you look up words'
arch=('i686' 'x86_64' 'armv7h')
url='https://www.unix-ag.uni-kl.de/~guenther/gnustep/dictionaryreader.html'
license=('GPL')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gcc-objc' 'gnustep-make')
source=("https://www.unix-ag.uni-kl.de/~guenther/gnustep/downloads/dictionaryreader/DictionaryReader-STABLE.tar.gz")
sha256sums=('6b19834e0eaf1aac58af638d0ba44a32c8251234bc83abcf9e43d13aa72439d8')

build() {
  cd $_pkgname 
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd $_pkgname 
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}