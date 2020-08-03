# Maintainer Franck STAUFFER <franck.stauffer@monaco.mc>
# Contributor: Ricardo Madriz <richin13@gmail.com>
# Contributor: Aoibhinn di Tori <email@aoibh.in>
# Contributor: Lara Maia <lara@craft.net.br>
# Contributor: estranho <estranho@diogoleal.com>
# Contributor: tsester <spyridon.papanastasiou@gmail.com>
# Contributor: dserban <dserban01@yahoo.com>
# Contributor: LeCrayonVert <sunrider@laposte.net>
# Contributor: jelly <jelle@vdwaa.nl>
# Contributor: evr <evanroman at gmail>

pkgname=agedu
pkgver=20200705
pkgrel=2
pkgdesc="A UNIX utility for tracking down wasted disk space"
arch=('i686' 'x86_64')
url="http://www.chiark.greenend.org.uk/~sgtatham/agedu/"
license=('MIT')
source=("https://www.chiark.greenend.org.uk/~sgtatham/$pkgname/$pkgname-$pkgver.2a7d4a2.tar.gz")
b2sums=('2802b223979b2f15efd14b6f1f445b9ca00312068ade3c26a057d54a65d5074fdcdee043c9673a59e4e6cc222deba7c817ee078a0a742f09ec1087ec921414bd')

prepare() {
  cd "$srcdir/$pkgname-$pkgver.2a7d4a2"
  ./mkauto.sh
  ./configure --prefix=/usr CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" CPPFLAGS="$CPPFLAGS"
}

build() {
  cd "$srcdir/$pkgname-$pkgver.2a7d4a2"
  make $MAKEFLAGS
}

package() {
  cd "$srcdir/$pkgname-$pkgver.2a7d4a2"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
