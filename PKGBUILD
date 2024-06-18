# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-file-moreutil'
pkgver='0.628'
pkgrel='1'
pkgdesc="File-related utilities"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.10.1')
makedepends=()
checkdepends=('perl-file-slurper>=0' 'perl-file-chdir>=0')
url='https://metacpan.org/release/File-MoreUtil'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PERLANCAR/File-MoreUtil-0.628.tar.gz')
md5sums=('2cbd917ac012ec26eb98594dbe14d4ed')
sha512sums=('ec74c06f506196222b464c3636a422077d73ad72d5c70c95c0860ff9bedfec90baea72ae58282560e7caa6a989bf972053b5a60d625ef2d35cdc21cedb166789')
_distdir="File-MoreUtil-0.628"

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
