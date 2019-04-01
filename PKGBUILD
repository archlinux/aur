# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-zilla-plugin-test-perl-critic'
pkgver='3.001'
pkgrel='1'
pkgdesc="Tests to check your code against best practices"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-section>=0.004' 'perl-dist-zilla>=0' 'perl-moose>=0' 'perl-sub-exporter-formethods>=0' 'perl-namespace-autoclean>=0' 'perl>=5.008')
makedepends=()
checkdepends=('perl-test-perl-critic>=0')
url='https://metacpan.org/release/Dist-Zilla-Plugin-Test-Perl-Critic'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Dist-Zilla-Plugin-Test-Perl-Critic-3.001.tar.gz')
md5sums=('a47ab06215e27a49db553fe885594c77')
sha512sums=('848c00dfabea61984c056fd16fff29a3b53aef3b46f2533ab5b6dcd0c8e0fb38984f307523e1d735825c4289cd58312c36ca5455d4a18848f278c2933ad7ce84')
_distdir="Dist-Zilla-Plugin-Test-Perl-Critic-3.001"

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
