# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-file-changenotify'
pkgver='0.24'
pkgrel='1'
pkgdesc="Watch for changes to files, cross-platform style"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-load>=0' 'perl-list-moreutils>=0' 'perl-moose>=0' 'perl-moosex-params-validate>=0' 'perl-moosex-semiaffordanceaccessor>=0' 'perl-namespace-autoclean>=0')
makedepends=()
checkdepends=('perl-test-exception>=0')
url='http://search.cpan.org/dist/File-ChangeNotify'
source=('http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/File-ChangeNotify-0.24.tar.gz')
md5sums=('959f1e52d854b4a94f357545d291edca')
sha512sums=('e09e6a6b11ad94fcb71e61608cd6b1c1d5c0c3a13a83be7eeca0134bd6e38d459a6670f4c1ada0e92a49b1ac49876c5c7135b811dc27ca2e6a6d4e0326cbc6d9')
_distdir="File-ChangeNotify-0.24"

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
