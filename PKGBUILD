# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-file-sharedir-pathclass'
pkgver='1.112440'
pkgrel='1'
pkgdesc="File::ShareDir returning Path::Class objects"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.010' 'perl-file-sharedir' 'perl-path-class' 'perl-sub-exporter')
makedepends=()
url='http://search.cpan.org/dist/File-ShareDir-PathClass'
source=('http://search.cpan.org/CPAN/authors/id/J/JQ/JQUELIN/File-ShareDir-PathClass-1.112440.tar.gz')
md5sums=('d7e31590bc244d867e0292d054bb05cc')
sha512sums=('d053bd981f90606beb0b16360a4ba296cf117b4fb083f970b23f495e03c01cf431f20828c624896ffb9c0a935a13a0442378c2e40879ff5ec773fa7441396ac8')
_distdir="File-ShareDir-PathClass-1.112440"

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
