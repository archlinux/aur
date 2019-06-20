# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mce'
pkgver='1.838'
pkgrel='1'
pkgdesc="Many-Core Engine for Perl providing parallel processing capabilities"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008')
makedepends=()
url='https://metacpan.org/release/MCE'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MARIOROY/MCE-1.838.tar.gz')
md5sums=('55691df4b05cc38476924387aef188d1')
sha512sums=('33db263a5b8b8eea73dbec2fff9dc0c92fbd075215f0c6a9e21621530cb7f93a23939a02211fe0481c8ba22c2d470437e716f6d2328b7b568cb1bd17b280dc65')
_distdir="MCE-1.838"

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
