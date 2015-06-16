# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-mojolicious-plugin-bcrypt'
pkgver='0.14'
pkgrel='1'
pkgdesc="bcrypt your passwords!"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-crypt-eksblowfish' 'perl-mojolicious>=4.0')
makedepends=('perl-mojolicious' 'perl-test-spelling')
url='http://search.cpan.org/dist/Mojolicious-Plugin-Bcrypt'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MINIMAL/Mojolicious-Plugin-Bcrypt-0.14.tar.gz')
md5sums=('491927ffe4404afca3ef49c96312357f')
sha512sums=('b34ff823599049f5e1c56f0c16fe558a2547e253d5510ea21699942470325c83f941210543fdc7c27dab27a8e84aaf6fa909931477dcb25a00a4694567c2b53d')
_distdir="Mojolicious-Plugin-Bcrypt-0.14"

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
