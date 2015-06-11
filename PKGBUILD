# Contributor: Michael Gerdau <mgd@qata.de>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-midi-perl'
pkgver='0.83'
pkgrel='1'
pkgdesc="read, compose, modify, and write MIDI files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/MIDI-Perl'
source=('http://search.cpan.org/CPAN/authors/id/C/CO/CONKLIN/MIDI-Perl-0.83.tar.gz')
md5sums=('f8c08ce48faaa4881f48ca93d35f5c76')
sha512sums=('0c8c77cf2d7f5890afea47e7c849c2f483373eed8b91c2a8eb884dde73ecc9c95714a8f8556bfaf4ea6ce2db9f8d62a8b265d15f0b0670b0fc554401a426fe48')
_distdir="MIDI-Perl-0.83"

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
