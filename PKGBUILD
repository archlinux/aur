# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-smtp-server'
pkgver='1.1'
pkgrel='1'
pkgdesc="A native Perl SMTP Server implementation for Perl."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/SMTP-Server'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MACGYVER/SMTP-Server-1.1.tar.gz')
md5sums=('29539763294a4cbe88d3e520b3de45c1')
sha512sums=('c24cc6def7e3f1eaf88c1c66ab845ea1c5226121f8ea25c6c019b7d90650fa3e3fc1974b0c9aa6542d80914ab0c98319bee8fce854a9c5e22633bfd7afe758cf')
_distdir="${srcdir}/SMTP-Server-1.1"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
