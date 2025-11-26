# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-catalyst-authentication-credential-http'
pkgver='1.019'
pkgrel='1'
pkgdesc="HTTP Basic and Digest authentication for Catalyst"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-catalyst-plugin-authentication>=0' 'perl-catalyst-runtime>=0' 'perl-class-accessor>=0' 'perl-crypt-sysrandom>=0.007' 'perl-http-message>=0' 'perl-string-escape>=0' 'perl-uri>=0' 'perl>=5.006')
makedepends=('perl-module-build-tiny')
checkdepends=('perl-test-exception>=0' 'perl-test-mockobject>=0' 'perl-test-needs>=0')
url='https://metacpan.org/release/Catalyst-Authentication-Credential-HTTP'
source=("http://search.cpan.org/CPAN/authors/id/A/AB/ABRAXXA/Catalyst-Authentication-Credential-HTTP-${pkgver}.tar.gz")
md5sums=('27b822c38993759b70c231d516d5ea8b')
sha512sums=('b8a071f641fcb7a655f10fe847078262e901a2e03da7f31ae87591713c0037c92817b56b6846682358f65009e57ffcc98bb5acf6af24ca9643a88fe1672b26b2')
_distdir="Catalyst-Authentication-Credential-HTTP-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
