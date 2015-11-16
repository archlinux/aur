# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-net-patricia'
pkgver='1.22'
pkgrel='1'
pkgdesc="Patricia Trie perl module for fast IP address lookups"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glibc>=2.22' 'perl-net-cidr-lite>=0.20' 'perl-socket6')
makedepends=()
url='https://metacpan.org/release/Net-Patricia'
source=('http://search.cpan.org/CPAN/authors/id/G/GR/GRUBER/Net-Patricia-1.22.tar.gz')
md5sums=('ef838f7512b050ca4b35d742f9565b3b')
sha512sums=('d76702d30784f8448dcf3a5269e052bc7bd6f5fe5a16824b6e3ede1d0182deb139522e45e1fb78749a7527ddbc950c213d843e43f45b5b0ed63b5b985b329861')
_distdir="Net-Patricia-1.22"

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
