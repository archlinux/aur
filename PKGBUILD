# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-wordpress-cli'
pkgver='1.04'
pkgrel='1'
pkgdesc="command line access to wordpress"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-date-manip>=5.48' 'perl-getopt-std-strict>=1.01' 'perl-leocharre-strings>=1.02' 'perl-smart-comments>=0' 'perl-string-shellquote>=0' 'perl-wordpress-xmlrpc>=1.23')
makedepends=()
url='http://search.cpan.org/dist/WordPress-CLI'
source=('http://search.cpan.org/CPAN/authors/id/L/LE/LEOCHARRE/WordPress-CLI-1.04.tar.gz')
md5sums=('8eff07c696246fbaf53e993a595d8245')
sha512sums=('82949f286d9e4567c42ef63183241408f478b1aaafc15407620bced005a761ea5682db4063cf22e922d65e2b7e53893debf275a4e41adfbdebe570e1b0fb1b38')
_distdir="WordPress-CLI-1.04"

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
