# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-html-fillinform'
pkgver='2.20'
pkgrel='1'
pkgdesc="Populates HTML Forms with data."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-parser>=3.26')
makedepends=()
url='http://search.cpan.org/dist/HTML-FillInForm'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MARKSTOS/HTML-FillInForm-2.20.tar.gz')
md5sums=('eeae1ef0fb6f7bde4e3db313c7c703a6')
sha512sums=('d00955fae1d9602ccda79e42e4a2863cb04b7070d72bdfe383b3b68ac56cf0a629bf2cbea35aaa042a379fe1c9679d7905407454d0e6c19433f6821dfbd27ebd')
_distdir="HTML-FillInForm-2.20"

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
