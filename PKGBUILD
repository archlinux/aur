# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-proc-daemon'
pkgver='0.22'
pkgrel='1'
pkgdesc="Run Perl program(s) as a daemon process"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-proc-processtable')
url='https://metacpan.org/release/Proc-Daemon'
source=('http://search.cpan.org/CPAN/authors/id/A/AK/AKREAL/Proc-Daemon-0.22.tar.gz')
md5sums=('0c10a6291d776025d3cfd58e49b540af')
sha512sums=('4845882034fc5ddd34361bff90d265fe512a7b3a54238bc899a07bf29ce1d030f45c6de769c146767436a61d17ddc7198e344a3c073bc168af16f05872f38af5')
_distdir="Proc-Daemon-0.22"

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
