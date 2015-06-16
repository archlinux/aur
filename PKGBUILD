# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-meta-builder'
pkgver='0.003'
pkgrel='1'
pkgdesc="Tools for creating Meta objects to track custom metrics."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-fennec-lite' 'perl-test-exception')
url='http://search.cpan.org/dist/Meta-Builder'
source=('http://search.cpan.org/CPAN/authors/id/E/EX/EXODIST/Meta-Builder-0.003.tar.gz')
md5sums=('9d6c9f88fdd1d5cb3e11e852ac105521')
sha512sums=('ee6c9b00116ba075d4e7c4b4f37b68a5f8e021b5e5414c7ee44a995b8820f72d631014185ce5ffc2fa9a0e2ce42db07322fbc1db6c5868426c366e1d7dcd08c7')
_distdir="Meta-Builder-0.003"

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
