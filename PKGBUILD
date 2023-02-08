# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-git-hooks'
pkgver='3.5.0'
pkgrel='1'
pkgdesc="Framework for implementing Git (and Gerrit) hooks"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-email-sender>=0' 'perl-email-simple>=0' 'perl-git-repository>=0' 'perl-git-repository-plugin-log>=0' 'perl-io-interactive>=0' 'perl-list-moreutils>=0' 'perl-log-any>=0' 'perl-path-tiny>=0.060' 'perl-text-glob>=0' 'perl-uri>=0')
makedepends=()
checkdepends=('perl-test-requires-git>=0')
url='https://metacpan.org/release/Git-Hooks'
source=("http://search.cpan.org/CPAN/authors/id/G/GN/GNUSTAVO/Git-Hooks-$pkgver.tar.gz")
md5sums=('2e6a9a0a1a3c6b126024d8a8aaacbb04')
sha512sums=('3e15e370e358a79ea765a766ee76c7633235151a59ba9ac2ce6c8f2f79845e88b237315710d853a0b2184e17fb9056b10f5576d28e09ee76daf2608368d0a598')
_distdir="Git-Hooks-$pkgver"

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
