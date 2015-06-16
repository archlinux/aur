# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-email-sender-transport-smtp-tls'
pkgver='0.15'
pkgrel='1'
pkgdesc="Email::Sender with Net::SMTP::TLS (Eg. Gmail)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-email-sender>=1.300006' 'perl-net-smtp-tls-butmaintained>=0.17')
makedepends=()
url='http://search.cpan.org/dist/Email-Sender-Transport-SMTP-TLS'
source=('http://search.cpan.org/CPAN/authors/id/F/FA/FAYLAND/Email-Sender-Transport-SMTP-TLS-0.15.tar.gz')
md5sums=('c1bc0d9a4486f1035af2c1ceda139f65')
sha512sums=('d2f44f5d2df42b0412c5556df7e846c9e1fb1dff0f864e2d801a158ffabaf255844c61c7e2bb2749a44448771c47f42784465f92ec4b8641ab4ab64dfbcef2a5')
_distdir="Email-Sender-Transport-SMTP-TLS-0.15"

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
