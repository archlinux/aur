# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname=perl-mail-mbox-messageparser
pkgver=1.5111
pkgrel=2
pkgdesc="A fast and simple mbox folder reader"
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=(perl-filehandle-unget)
checkdepends=(perl-test-compile perl-text-diff perl-test-pod perl-test-pod-coverage perl-universal-require)
url="http://search.cpan.org/dist/Mail-Mbox-MessageParser"
source=("http://search.cpan.org/CPAN/authors/id/D/DC/DCOPPIT/Mail-Mbox-MessageParser-1.5111.tar.gz")
sha512sums=('c0b0c4066da3be2d8b669eed1a527309aefbbedf08531cd8eb524db37319532df75719784a557929adc409fc680a384d731f8b06768020a18855e34f392d6d0f')
_distdir="Mail-Mbox-MessageParser-1.5111"

build() {
  cd "$srcdir/$_distdir"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_distdir"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# vim:set ts=2 sw=2 et:
