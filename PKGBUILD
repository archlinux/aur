# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-file-pid'
pkgver='1.01'
pkgrel='1'
pkgdesc="Pid File Manipulation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor')
makedepends=()
url='http://search.cpan.org/dist/File-Pid'
source=('http://search.cpan.org/CPAN/authors/id/C/CW/CWEST/File-Pid-1.01.tar.gz')
md5sums=('d927b40215cbfbff233d9feb53529532')
sha512sums=('37deaa427b6b3ec2126d53f78eb437fe3b06af4167cdf46455434843c64b780f6d9941a3264d714eb8c1d46ed57dd6113d2ee17abbd1a7299a31e5a1a541999a')
_distdir="File-Pid-1.01"

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
