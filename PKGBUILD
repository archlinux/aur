# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-moosex-relatedclassroles'
pkgver='0.004'
pkgrel='1'
pkgdesc="Apply roles to a class related to yours"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=0.73' 'perl-moosex-role-parameterized>=0.04')
makedepends=()
url='http://search.cpan.org/dist/MooseX-RelatedClassRoles'
source=('http://search.cpan.org/CPAN/authors/id/H/HD/HDP/MooseX-RelatedClassRoles-0.004.tar.gz')
md5sums=('76d8afd0f24f68f564e5891b8329d52e')
sha512sums=('afd58e3c30fa43d87c20682a82a83540395bc44b8d9f0232409abbbf54856e463461ff36f644ede50385f71f24ed3dd0f71ff5b9ed24ef40d6ef6786fa50ea5e')
_distdir="MooseX-RelatedClassRoles-0.004"

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
