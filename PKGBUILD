# CPAN Name  : Catalyst-Plugin-Unicode
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Contributor: xRemaLx <anton.komolov@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 0.18
pkgname='perl-catalyst-plugin-unicode'
_pkgname='Catalyst-Plugin-Unicode'
pkgver='0.93'
pkgrel='2'
pkgdesc="Unicode aware Catalyst (old style)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-catalyst-runtime>=5.70' 'perl-io-stringy' 'perl-mro-compat>=0.10' 'perl-test-use-ok' 'perl-test-www-mechanize-catalyst')
url='https://metacpan.org/release/Catalyst-Plugin-Unicode'
source=("https://cpan.metacpan.org/authors/id/B/BO/BOBTFISH/${_pkgname}-${pkgver}.tar.gz")
md5sums=('f362bfa2ec2bb70378717122e2da018d')
sha512sums=('ef8183f4e69bf2084d312390c789d17b4fca91415b4466031a2e1d0f188b86ef9f79219fb27bd1e84d2e5b84dbfce0534ecacdc94162dd246a718fbbe4c462b0')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/${_pkgname}-${pkgver}"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

