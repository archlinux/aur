# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-data-formvalidator'
pkgver='4.81'
pkgrel='1'
pkgdesc="Validates user input (usually from an HTML form) based"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-date-calc>=5' 'perl-email-valid' 'perl-file-mmagic>=1.17' 'perl-image-size' 'perl-mime-types>=1.005' 'perl-perl6-junction>=1.1' 'perl-regexp-common')
makedepends=()
url='http://search.cpan.org/dist/Data-FormValidator'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MARKSTOS/Data-FormValidator-4.81.tar.gz')
md5sums=('575116fb7857491e77110ea7eaf6b3a2')
sha512sums=('c9939686e60bb75e658a95407d616e7907f97e85d049d69abaf7ac89678985c555fe6d4177c773916c57964a45a423582e74d3cf79d75cef87a22f913ef82e23')
_distdir="Data-FormValidator-4.81"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
