# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-proc-daemon'
pkgver='0.19'
pkgrel='1'
pkgdesc="Run Perl program(s) as a daemon process"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-proc-processtable')
url='https://metacpan.org/release/Proc-Daemon'
source=('http://search.cpan.org/CPAN/authors/id/A/AK/AKREAL/Proc-Daemon-0.19.tar.gz')
md5sums=('5e3114a50f00432b84c86280393032c1')
sha512sums=('11ed2c33f785692ee2ba7f8e15d2e729497ba44684f5764a29bf33752db675b565fc12241cb45a1d79b020543b03a74aa036400da41cdee933939bcc757a81fc')
_distdir="Proc-Daemon-0.19"

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
