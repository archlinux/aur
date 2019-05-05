# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-zilla-plugin-prepender'
pkgver='2.004'
pkgrel='1'
pkgdesc="Prepend lines at the top of your perl files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dist-zilla>=0' 'perl-module-build>=0.28' 'perl-moose>=0' 'perl-path-tiny>=0' 'perl>=5.008')
makedepends=()
checkdepends=('perl-test-deep>=0')
url='https://metacpan.org/release/Dist-Zilla-Plugin-Prepender'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Dist-Zilla-Plugin-Prepender-2.004.tar.gz')
md5sums=('8c99e0e31e15d5168f67a5617bc5aef9')
sha512sums=('fae3effd765b1f2f7c5f844c53cd634a964023132bce87ae9d6aed5152b13b3af919879e9b4a21c6008f57aac3cf307077e85ec0a7d2b18c9c2bb409f0ead58c')
_distdir="Dist-Zilla-Plugin-Prepender-2.004"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
