# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-proc-daemon
pkgver=0.23
pkgrel=1
pkgdesc="Run Perl program(s) as a daemon process"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-proc-processtable')
url='https://metacpan.org/release/Proc-Daemon'
source=("http://search.cpan.org/CPAN/authors/id/A/AK/AKREAL/Proc-Daemon-$pkgver.tar.gz")
md5sums=('c5fb746a14b6948bb8533a6b6e9650bc')
sha512sums=('078c4b0dc3a16ac0ccf98814a639ef1ea8009cdb3b133182761cdb5ea5e29bac2d8967ef6d2a902e15dc30e21cbd3aeff449a3efe67dfbc4f76a619491782bae')
_distdir="Proc-Daemon-$pkgver"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd $_distdir
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd $_distdir
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd $_distdir
  make install

  find "$pkgdir" '(' -name .packlist -o -name perllocal.pod ')' -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
