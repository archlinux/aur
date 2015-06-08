# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-role-commons'
pkgver='0.101'
pkgrel='1'
pkgdesc="roles that can be commonly used, for the mutual benefit of all"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-class-load' 'perl-moo' 'perl-object-id' 'perl-scalar-does>=0.006')
makedepends=()
url='http://search.cpan.org/dist/Role-Commons'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/Role-Commons-0.101.tar.gz')
md5sums=('90aa9c651dc5a2cecd9ccf8a65618912')
sha512sums=('4193fbad535a2a4abb388363b0d02a97501c7075537cdb2e992c55c4db30d9510db95c759a2684713643eaac2fd6447d990fc0a1953d26e1c578499810b4968b')
_distdir="Role-Commons-0.101"

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
