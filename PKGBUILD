# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-git-repository-plugin-log'
pkgver='1.314'
pkgrel='2'
pkgdesc="Add a log() method to Git::Repository"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-git-repository>=1.309' 'perl>=5.006')
makedepends=('perl-pod-coverage-trustpod>=0.100003')
checkdepends=('perl-git-repository>=0' 'perl-test-cpan-meta>=0.25' 'perl-test-pod>=1.51' 'perl-test-pod-coverage>=1.10' 'perl-test-requires-git>=1.005')
url='https://metacpan.org/release/Git-Repository-Plugin-Log'
source=("http://search.cpan.org/CPAN/authors/id/B/BO/BOOK/Git-Repository-Plugin-Log-$pkgver.tar.gz")
md5sums=('49fecf8c5a173e824a5c2fe7445ee2aa')
sha512sums=('44f86df8a632a564e900a6aeee14ace371e7d9950046cb8e1f9cd1674c70f92da19ebbfaf6fb29a661d8826128a69dae20a509094ed52c042e311f51463f29d8')
_distdir="Git-Repository-Plugin-Log-$pkgver"

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
