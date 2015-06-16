# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-mail-sender'
pkgver='0.8.23'
pkgrel='1'
pkgdesc="module for sending mails with attachments through an SMTP server"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Mail-Sender'
source=('http://search.mcpan.org/CPAN/authors/id/J/JE/JENDA/Mail-Sender-0.8.23.tar.gz')
md5sums=('c80bb35cb2fee79d7421153bfefdcf60')
sha512sums=('e9c2e2806976aaea568885f41ff774b9cb460707123c0926ed20428b00a9e9db796d67dca938dc16463eeb8e1c92f8e82ba60c92bc053c20d5570d5604df651c')
_distdir="Mail-Sender-0.8.23"

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
