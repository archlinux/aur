# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-crypt-dsa'
pkgver='1.17'
pkgrel='1'
pkgdesc="DSA Signatures and Key Generation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006' 'perl-data-buffer>=0.01' 'perl-digest-sha1' 'perl-file-which>=0.05')
makedepends=()
url='http://search.cpan.org/dist/Crypt-DSA'
source=('http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/Crypt-DSA-1.17.tar.gz')
md5sums=('0a64dcd77e796ebacad4c6af2df74b57')
sha512sums=('2eac27cb08439a6d5cfdf1ee5f38412bc1dddb53c1865e5adc4f8c758ba1d221e5d30608bd12178beb15aed28940fa5db547520d57d8714919e20f0588fb1bfc')
_distdir="Crypt-DSA-1.17"

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
