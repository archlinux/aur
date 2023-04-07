# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-zilla-plugin-git-describeversion'
pkgver='1.004'
pkgrel='1'
pkgdesc="Provide version using git-describe"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dist-zilla>=4' 'perl-git-describeversion>=0' 'perl-moose>=0')
makedepends=()
checkdepends=('perl-test-mockobject>=1.09')
url='https://metacpan.org/release/Dist-Zilla-Plugin-Git-DescribeVersion'
source=('http://search.cpan.org/CPAN/authors/id/R/RW/RWSTAUNER/Dist-Zilla-Plugin-Git-DescribeVersion-1.004.tar.gz')
md5sums=('94620a48f5819cc5c2d8bb9497988cf6')
sha512sums=('7dc25c1f3f1be4c2c5e46b4f5eb373904c39bd810f633c754fa854e59ce6b2762d9ffc9ba0e3deb0b2032522e3f0af93b645b4dd1ec0295898f800e8a248544d')
_distdir="Dist-Zilla-Plugin-Git-DescribeVersion-1.004"

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
