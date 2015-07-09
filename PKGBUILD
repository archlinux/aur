# Contributor: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-io-captureoutput'
_realname='IO-CaptureOutput'
pkgver='1.1104'
pkgrel='1'
pkgdesc="capture STDOUT and STDERR from Perl code, subprocesses or XS"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url="http://search.cpan.org/dist/$_realname"
source=("http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/$_realname-$pkgver.tar.gz")
sha512sums=('5694635c91e4dd11279c33fb9d58e2eb27014f4ea0a976e62c23505524e3d37264aab6d6b1cfe5d925e123d6aa240e574dbc4f489c6c1007da09631368af94f5')
_distdir="$_realname-$pkgver"

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
