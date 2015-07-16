# Maintainer: jsteel <jsteel at aur.archlinux.org>
# Contributor: Marvin Lampe <marvin.lampe@gmx.de>

pkgname=perl-universal-require
pkgver=0.18
pkgrel=1
pkgdesc="UNIVERSAL::require - require() modules from a variable"
arch=('any')
url="http://search.cpan.org/~neilb/UNIVERSAL-require/lib/UNIVERSAL/require.pm"
license=('PerlArtistic')
makedepends=('perl')
source=(http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/UNIVERSAL-require-$pkgver.tar.gz)
md5sums=('2cdfd54bc7e270c77456a8e929a091b3')

build() {
  cd "$srcdir"/UNIVERSAL-require-$pkgver

  perl Makefile.PL

  make
}

package() {
  cd "$srcdir"/UNIVERSAL-require-$pkgver

  install -Dm644 "$srcdir"/UNIVERSAL-require-$pkgver/blib/lib/UNIVERSAL/require.pm \
    "$pkgdir"/usr/lib/perl5/vendor_perl/UNIVERSAL/require.pm
  install -Dm644 "$srcdir"/UNIVERSAL-require-$pkgver/blib/man3/UNIVERSAL::require.3pm \
    "$pkgdir"/usr/share/man/man3/UNIVERSAL::require.3pm
}
