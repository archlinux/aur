# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-minion'
pkgver='2.01'
pkgrel='1'
pkgdesc="Job queue"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbm-deep>=2.0011' 'perl-mojolicious>=6.0' 'perl>=5.10.1')
makedepends=()
url='https://metacpan.org/release/Minion'
source=('http://search.cpan.org/CPAN/authors/id/S/SR/SRI/Minion-2.01.tar.gz')
md5sums=('fcc46041f28ee8de1faa6f4e91744aa1')
sha512sums=('70715280ae551c776959a5da1ffc46ca4a83e6b16241ee07cf5d812ee94245d5d40d64c1c64e47bbfbf0361e5784a2c4481aba7691f548e034c6e2118e19af97')
_distdir="Minion-2.01"

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
