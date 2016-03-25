# Maintainer: John W. Trengrove <john@retrofilter.com>

pkgname=stagit
pkgver=0.3.1
pkgrel=1
pkgdesc="static git page generator"
arch=('x86_64' 'i686')
url="http://git.2f30.org/stagit"
license=('MIT')
source=("http://dl.2f30.org/releases/stagit-${pkgver}.tar.gz")
depends=('libgit2')
makedepends=('git')
sha1sums=('630ac6e84be64e2089ffce9be6321d0b523cca68')

build() {
  cd stagit-${pkgver}
  make
}

package() {
  cd stagit-${pkgver}
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
