# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-video-info'
pkgver='0.993'
pkgrel='2'
pkgdesc="Video::Info - Retrieve video properties such as: height width codec fps"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-makemethods' 'perl-mp3-info' 'perl-video-openquicktime')
makedepends=()
url='http://search.cpan.org/dist/Video-Info'
source=('http://search.cpan.org/CPAN/authors/id/A/AL/ALLENDAY/Video-Info-0.993.tar.gz')
md5sums=('509d49886aa49ef712024789a53f0320')
sha512sums=('a53f58ba6b5fda2d00f7a55f26d9b84a12a25690909cdf92133c833c9a1f1a9f09ca5246dd8f1bce1a98032049bb9055be3418605e6ced6af06269688ec03d00')
_distdir="Video-Info-0.993"

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
