# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-data-clean'
pkgver='0.508'
pkgrel='4'
pkgdesc="Clean data structure"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-clone-pp>=0' 'perl-data-dmp>=0.242' 'perl-datetime>=0' 'perl-log-ger>=0.038' 'perl-string-linenumber>=0' 'perl-string-perlquote>=0' 'perl>=5.10.1')
makedepends=()
checkdepends=('perl-test-exception>=0')
url='https://metacpan.org/release/Data-Clean'
source=("http://search.cpan.org/CPAN/authors/id/P/PE/PERLANCAR/Data-Clean-$pkgver.tar.gz")
md5sums=('ba2a9520f35930bda4e78f668de9c902')
sha512sums=('3fd9896d5cc8f0d98f6bb7f2fd21d50a4954691f2b304a48de7955d0c003e7ff39194db9a136f0a013d78d7b993afbe6f0bb504c0da13c70f8a0587f8592658b')
_distdir="Data-Clean-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
