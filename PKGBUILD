# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-lingua-stem-ru'
pkgver='0.04'
pkgrel='2'
pkgdesc="Perl/CPAN Module Lingua::Stem::Ru: Porter's stemming algorithm for Russian (KOI8-R only)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://search.cpan.org/dist/Lingua-Stem-Ru'
source=("http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/Lingua-Stem-Ru-${pkgver}.tar.gz")
md5sums=('5402a0b56336b232250b112f8d0b65f1')
sha512sums=('30ad7e74cbc065d3a9534f099a7c08b7aef5ec2290609e72704d1ae4ae0ea1a3622dfd0a4012fb169903fe7ef959d24d38e51cd330bc1c38ac09a1d50a76962e')
_distdir="Lingua-Stem-Ru-${pkgver}"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
