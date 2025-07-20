# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-critic-strictersubs'
pkgver='0.08'
pkgrel='2'
pkgdesc="Perl::Critic plugin for stricter subroutine checks"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-file-pathlist>=0' 'perl-list-moreutils>=0' 'perl-module-build>=0.4' 'perl-ppi>=0' 'perl-perl-critic>=0' 'perl>=5.6.1')
makedepends=()
checkdepends=('perl-test-warnings>=0')
url='https://metacpan.org/release/Perl-Critic-StricterSubs'
source=("http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/Perl-Critic-StricterSubs-$pkgver.tar.gz")
md5sums=('4cb9bd80fdd33ec71565af51936c8057')
sha512sums=('a405fca247a86b64133b85553db5cb396fd205436c7ffe805d479b4ed117b929a03ec3b0fa8655ce63789d3d578e60586f9ce3544bebde36e39a231219850940')
_distdir="Perl-Critic-StricterSubs-$pkgver"

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
