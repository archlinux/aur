# Maintainer: sh0 <mee@sh0.org>
pkgname=perl-nagios-plugin
pkgver=0.35
pkgrel=1
pkgdesc="A family of perl modules to streamline writing Nagios plugins"
arch=('any')
url="http://search.cpan.org/dist/Nagios-Plugin"
license=('unknown')
depends=('perl>=5.10.0' 'perl-params-validate' 'perl-class-accessor' 'perl-config-tiny' 'perl-math-calc-units')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/T/TO/TONVOON/Nagios-Plugin-$pkgver.tar.gz)
md5sums=('96b3510798e28f3ebed8c23f4225e80e')

build() {
  cd "$srcdir/Nagios-Plugin-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/Nagios-Plugin-$pkgver"
  make install DESTDIR="$pkgdir/"
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}

# vim:set ts=2 sw=2 et:
