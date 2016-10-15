# Maintainer: Joshua Haase <hahj87@gmail.com>
pkgname=prinseq-lite
pkgver=0.20.4
pkgrel=1
pkgdesc="Pre-process and show information of sequence data"
arch=('any')
url="http://prinseq.sourceforge.net/"
license=('GPL3')
groups=()
depends=('perl>=5.10.0')
makedepends=('')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://sourceforge.net/projects/prinseq/files/standalone/${pkgname}-${pkgver}.tar.gz")
noextract=()
sha256sums=('9b5e0dce3b7f02f09e1cc7e8a2dd77c0b133e5e35529d570ee901f53ebfeb56f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -m 0755 -d "$pkgdir/usr/bin"
  install -m 0755 *.pl "$pkgdir/usr/bin"
  install -m 0755 -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 0644 COPYING "$pkgdir/usr/share/licenses/$pkgname"
  install -m 0755 -d "$pkgdir/usr/share/$pkgname"
  install -m 0644 ChangeLog README example/* "$pkgdir/usr/share/$pkgname"
}

# vim:set ts=2 sw=2 et:
