# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-mojox-renderer-xslate'
pkgver='0.09'
pkgrel='1'
pkgdesc="Text::Xslate renderer for Mojo"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mojolicious>=3' 'perl-text-xslate>=0.2013' 'perl-try-tiny')
makedepends=()
url='http://search.cpan.org/dist/MojoX-Renderer-Xslate'
source=('http://search.cpan.org/CPAN/authors/id/G/GR/GRAY/MojoX-Renderer-Xslate-0.09.tar.gz')
md5sums=('49be2805556bc3e9c71ca6343f16c3bf')
sha512sums=('8b23e5931dbadf761d2cdfadd0e7bb44ee9f8992413ebfd741217b97fbcc416f69a74160bcc24b8786c59778ad2a95e7d89717371d01b9e1125eba8efe681022')
_distdir="MojoX-Renderer-Xslate-0.09"

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
