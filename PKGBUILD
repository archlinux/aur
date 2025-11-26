# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-json-validator'
pkgver='5.15'
pkgrel='1'
pkgdesc="Perl/CPAN Module JSON::Validator: Validate data against a JSON schema"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.016' 'perl-mojolicious>=7.28' 'perl-yaml-libyaml')
makedepends=()
optdepends=('perl-data-validate-ip: IPv4 and IPv6 validation'
            'perl-net-idn-encode: IDNs validation'
            'perl-data-validate-domain: Domain and host name validation')
checkdepends=('perl-test-deep')
url='https://metacpan.org/release/JSON-Validator'
source=("http://search.cpan.org/CPAN/authors/id/J/JH/JHTHORSEN/JSON-Validator-$pkgver.tar.gz")
md5sums=('63f2f0bcfaa0ce2b09fdbfbd5de3590a')
sha512sums=('ed8cae5a35f1e535296c821660fb41ba0e1a22605f6297431dbf15a39f922415fae1b978a74c21eeb4661ea9989713392a0bcb85bd32141bfafc58769de86502')
_distdir="JSON-Validator-$pkgver"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
