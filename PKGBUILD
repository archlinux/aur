# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Peter Simons <simons@cryp.to>

pkgname=banner
pkgver=1.3.2
pkgrel=10
pkgdesc="Print large banners to ASCII terminals"
arch=('x86_64')
url="https://shh.thathost.com/pub-unix/"
license=('GPL')
depends=('glibc')
makedepends=('shhmsg' 'shhopt')
conflicts=('sysvbanner')
source=(https://shh.thathost.com/pub-unix/files/$pkgname-$pkgver.tar.gz)
md5sums=('9bd1dc58d3bced525a19194b92d20217')
sha256sums=('0dc0ac0667b2e884a7f5ad3e467af68cd0fd5917f8c9aa19188e6452aa1fc6d5')

build() {
  cd $pkgname-$pkgver

  make OPTIM="$CFLAGS" dep
  make OPTIM="$CFLAGS"
}

package() {
  cd $pkgname-$pkgver

  make INSTBASEDIR="$pkgdir"/usr/ \
    INSTMANDIR="$pkgdir"/usr/share/man/man1/ install
}
