# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-net-ssh-perl'
pkgver='1.35'
pkgrel='1'
pkgdesc="Perl client interface to SSH"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-convert-pem>=0.05' 'perl-crypt-dh>=0.01' 'perl-crypt-dsa>=0.11' 'perl-crypt-idea' 'perl-crypt-rsa>=1.37' 'perl-digest-bubblebabble>=0.01' 'perl-digest-hmac' 'perl-digest-sha1>=2.10' 'perl-math-gmp>=1.04' 'perl-math-pari>=2.001804' 'perl-string-crc32>=1.2')
makedepends=()
url='http://search.cpan.org/dist/Net-SSH-Perl'
source=('http://search.cpan.org/CPAN/authors/id/S/SC/SCHWIGON/Net-SSH-Perl-1.35.tar.gz')
md5sums=('6d199022878582990c7d027123c43312')
sha512sums=('5b934b63111ea23fa62228192482d84811fbe6be80701b5a67a486ae84795f5bc031ceb0e7b31f1bc1b031aaf26f5f90d6bab1fdd355949de2d5f423041dd06d')
_distdir="Net-SSH-Perl-1.35"

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
