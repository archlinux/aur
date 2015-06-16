# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-email-delete'
pkgver='2.001'
pkgrel='1'
pkgdesc="Delete Messages from Folders"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-email-folder>=0.84' 'perl-email-foldertype>=0.7' 'perl-email-localdelivery>=0.213' 'perl-email-simple>=1.92')
makedepends=()
url='http://search.cpan.org/dist/Email-Delete'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Email-Delete-2.001.tar.gz')
md5sums=('5dc16ac894fb8f8e3d2967abb072bf6b')
sha512sums=('7a714cc8ad96a045973552fc09bf989d8c0400dcd2da658f4e30482b0e4e9fccd0c9f47081a9c0876098eddf6b3f4ec9ff3c72047577f03d1c43ea830a9d9da7')
_distdir="Email-Delete-2.001"

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
