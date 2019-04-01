# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-pod-weaver'
pkgver='4.015'
pkgrel='1'
pkgdesc="weave together a Pod document from an outline"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-config-mvp>=2' 'perl-config-mvp-reader-ini>=0' 'perl-datetime>=0' 'perl-list-moreutils>=0' 'perl-log-dispatchouli>=1.100710' 'perl-mixin-linewise>=0' 'perl-module-runtime>=0' 'perl-moose>=0' 'perl-ppi>=0' 'perl-params-util>=0' 'perl-pod-elemental>=0.100220' 'perl-software-license>=0' 'perl-string-flogger>=1' 'perl-string-formatter>=0.100680' 'perl-string-rewriteprefix>=0' 'perl-namespace-autoclean>=0')
makedepends=()
checkdepends=('perl-test-differences>=0')
url='https://metacpan.org/release/Pod-Weaver'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Pod-Weaver-4.015.tar.gz')
md5sums=('dd3f223882d17273d5b4ea6d600c1db9')
sha512sums=('333e29757766b0c2ddd39cde3ef0649a3e79143a611c48c3644807d248c0c7d6a027683ca88158bf59b369b1e329cdd6f3f1c3dda6c3baaa26648f80ecdb4a8d')
_distdir="Pod-Weaver-4.015"

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
