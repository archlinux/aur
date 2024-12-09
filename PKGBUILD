# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Thomas Dziedzic
# Contributor: Mihai Militaru <mihai dot militaru at xmpp dot ro>
pkgname=tklib
pkgver=0.9
pkgrel=1
pkgdesc='Tklib specializes in utilities for GUI programming.'
arch=('i686' 'x86_64')
url="https://core.tcl-lang.org/tklib/home"
license=('custom')
depends=('tk' 'tcllib')
source=(https://github.com/tcltk/tklib/archive/refs/tags/tklib-$pkgver.tar.gz)
sha256sums=('4709f591ed24c27b1b2b4333f07e5182fe28cab651214038186aa1d5bb5a9b99')

build() {
  cd $pkgname-$pkgname-$pkgver
  ./configure --prefix=/usr
  make all
}

package() {
  cd $pkgname-$pkgname-$pkgver
  install -Dm644 license.terms "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  make DESTDIR="$pkgdir" install
}
