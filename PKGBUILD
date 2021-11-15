# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=info2man
pkgver=1.1
pkgrel=1
pkgdesc="Converts info documentation pages to man pages"
arch=('i686' 'x86_64')
url="http://www.cskk.ezoshosting.com/cs/css/info2pod.html"
license=('unknown')
depends=('perl4-corelibs')
source=(http://deb.debian.org/debian/pool/main/i/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz)

package() {
  cd "$srcdir"/$pkgname-$pkgver

  _perlver=`pacman -Q perl | awk '{print $2}' | awk -F '.' '{print $1"."$2}'`
  install -d "$pkgdir"/usr/bin "$pkgdir"/usr/lib/perl5/$_perlver/vendor_perl/cs
  install -m755 info2pod info2man "$pkgdir"/usr/bin
  cp -R cs/* "$pkgdir"/usr/lib/perl5/$_perlver/vendor_perl/cs
}

md5sums=('37e9cd74683e1832a4f27ad5c7961a7b')
