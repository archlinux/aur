# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32
#
# The latest release is version 0.93 (see url).
# I may should have stick to this and not minor versions.
#

pkgname='perl-marc-xml'
pkgver='1.0.4'
pkgrel='1'
pkgdesc="Perl/CPAN Module MARC::XML: Convert between MARC and XML."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-marc-charset>=0.98' 'perl-marc-record>=2' 'perl-xml-libxml>=1.66')
makedepends=()
url='https://metacpan.org/release/MARC-XML'
source=("http://search.cpan.org/CPAN/authors/id/G/GM/GMCHARLT/MARC-XML-$pkgver.tar.gz")
md5sums=('4f0f11ddb007f9ac41569608f3d72a20')
sha512sums=('2b84b50cd4973dcfe4bac27295710da0438130053b7ee00ad50690f7e87a190d64b132e62f486cb36fb91b93c5d412292facc7c31d2feb97b4bf3f32a947dd77')
_distdir="MARC-XML-$pkgver"

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
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
