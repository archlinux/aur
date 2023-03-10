# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-zilla-role-bootstrap'
pkgver='1.001004'
pkgrel='1'
pkgdesc="Shared logic for bootstrap things."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dist-zilla>=0' 'perl-file-copy-recursive>=0' 'perl-list-utilsby>=0' 'perl-moose>=0' 'perl-path-tiny>=0' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Dist-Zilla-Role-Bootstrap'
source=('http://search.cpan.org/CPAN/authors/id/K/KE/KENTNL/Dist-Zilla-Role-Bootstrap-1.001004.tar.gz')
md5sums=('39768a5574a5b58ef9c431e114a21dd4')
sha512sums=('992388bb759e9ef18c3b0c2c6355b073e8fb94a9f656cc42fcefdd45c8dd8f020c274d47d16f99d3bbac561bf40d8d83140ad5e33954c7743da9e5abda14ca91')
_distdir="Dist-Zilla-Role-Bootstrap-1.001004"

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
