# Maintainer : Justin Vreeland <vreeland.justin at gmail dot com>
# Former:
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-type-tiny'
pkgver='1.000005'
pkgrel='1'
pkgdesc="tiny, yet Moo(se)-compatible type constraint"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-exporter-tiny>=0.026' 'perl>=5.6.1')
makedepends=()
url='http://search.cpan.org/dist/Type-Tiny'
source=('http://www.cpan.org/authors/id/T/TO/TOBYINK/Type-Tiny-1.000005.tar.gz')
md5sums=('2914b0e6b35c35f657d426fba29b4520')
sha512sums=('5817ee937384cccbea71fa69f8c2202d721c648a18eedf089529fbb956b2d050b889606e69c8bc3e1d94fb6f638b6cac01394b5534f17a8be6cdf82d69b965b6')
_distdir="Type-Tiny-1.000005"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
