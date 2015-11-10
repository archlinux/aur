# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=sleep-until
pkgver=1
pkgrel=1
pkgdesc='Sleep until a specified time'
arch=('any')
url='https://github.com/maandree/sleep-until'
license=('AGPL3')
depends=('linux>=2.6.25' 'glibc>=2.8')
makedepends=('glibc>=2.8' 'gcc' 'general-preprocessor' 'grep' 'texinfo' 'auto-auto-complete')
install=sleep-until.install
source=(https://github.com/maandree/sleep-until/archive/$pkgver.tar.gz)
sha256sums=(fa1776be3f29c550f6eff48bcf714c76fcf399f1c7bac1d7306c5abc7fe14e17)


build() {
  cd "$srcdir/sleep-until-$pkgver"
  make command info shell
}

package() {
  cd "$srcdir/sleep-until-$pkgver"
  make DESTDIR="$pkgdir" install-base install-info install-man install-shell
}

