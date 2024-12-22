# Maintainer: Piotr Rogoża <piotr dot r dot public at gmail dot com>
# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: René Wagner <rwagner at rw-net dot de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-file-find-object'
pkgver='0.3.9'
pkgrel='1'
pkgdesc="An object oriented File::Find replacement"
arch=('any')
license=('Artistic-2.0')
options=('!emptydirs')
depends=('perl-class-xsaccessor>=0' 'perl-file-treecreate>=0' 'perl-module-build>=0.28' 'perl>=5.008')
checkdepends=('perl-test-file>=1.993')
url='https://metacpan.org/release/File-Find-Object'
source=('http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/File-Find-Object-0.3.9.tar.gz')
sha512sums=('6d4dffd7586c7b752390dbcb220d9a849becec161b251c39a5146abb3f736efb7301e296d274f2dcccc95626c00e9c43a8e4c46cae23645f4aedd67914414667')
_distdir="File-Find-Object-0.3.9"

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
