# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-app-prt'
pkgver='0.22'
pkgrel='2'
pkgdesc="Command line Perl Refactoring Tool"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-capture-tiny>=0.39' 'perl-class-load>=0' 'perl-file-copy-recursive>=0' 'perl-file-find-rule>=0' 'perl-file-pushd>=1.013' 'perl-io-interactive>=0' 'perl-ppi>=0.844' 'perl-path-class>=0' 'perl>=5.10.1')
makedepends=()
checkdepends=('perl-test-class>=0' 'perl-test-deep>=0' 'perl-test-fatal>=0' 'perl-test-mock-guard>=0')
url='https://metacpan.org/release/App-PRT'
source=("http://search.cpan.org/CPAN/authors/id/H/HI/HITODE/App-PRT-$pkgver.tar.gz")
md5sums=('2d38c1683b5081ff16acb7ca6db65cc0')
sha512sums=('31ea87c2f3e8840bab898dd4de5906f2c3a96e5b006fa28872b2182cbba54bb141209f2a57933d2870cb6dac666e65086bab8a6e15eeda1e6d87fcf20f995698')
_distdir="App-PRT-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
   /usr/bin/perl Build.PL
   /usr/bin/perl Build
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  /usr/bin/perl Build test
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
