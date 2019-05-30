# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=info2man
pkgver=1.0
pkgrel=5
pkgdesc="Converts info documentation pages to man pages"
arch=('i686' 'x86_64')
url="http://www.cskk.ezoshosting.com/cs/css/info2pod.html"
license=('unknown')
depends=('perl4-corelibs')
source=(http://www.cskk.ezoshosting.com/cs/css/$pkgname.tar.gz)

package() {
  cd "$srcdir"

  _perlver=`pacman -Q perl | awk '{print $2}' | awk -F '.' '{print $1"."$2}'`
  install -d "$pkgdir"/usr/bin "$pkgdir"/usr/lib/perl5/$_perlver/vendor_perl/cs
  install -m755 info2pod info2man "$pkgdir"/usr/bin
  cp -R cs/* "$pkgdir"/usr/lib/perl5/$_perlver/vendor_perl/cs
}

md5sums=('303b9bf313e88558ff577806398f6c4c')
