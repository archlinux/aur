# Maintainer: Ricardo Madriz <richin13@gmail.com>
# Contributor: Aoibhinn di Tori <email@aoibh.in>
# Contributor: Lara Maia <lara@craft.net.br>
# Contributor: estranho <estranho@diogoleal.com>
# Contributor: tsester <spyridon.papanastasiou@gmail.com>
# Contributor: dserban <dserban01@yahoo.com>
# Contributor: LeCrayonVert <sunrider@laposte.net>
# Contributor: jelly <jelle@vdwaa.nl>
# Contributor: evr <evanroman at gmail>

pkgname=agedu
pkgver=20180329
_pkghash=af641e6
pkgrel=1
pkgdesc="Track down wasted disk space"
arch=('i686' 'x86_64')
url="http://www.chiark.greenend.org.uk/~sgtatham/agedu/"
license=('MIT')
depends=('glibc')
source=("http://www.chiark.greenend.org.uk/~sgtatham/$pkgname/$pkgname-$pkgver.$_pkghash.tar.gz")
md5sums=('ec647c02f5719aeac4d87fe8e3662270')

build() {
  cd "$srcdir/$pkgname-$pkgver.$_pkghash"
  ./mkauto.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver.$_pkghash"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
