# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-file-dirwalk'
pkgver='0.5'
pkgrel='1'
pkgdesc="walk through a directory tree and run callbacks
on files, symlinks and directories."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-test-exception>=0.27')
url='http://search.cpan.org/dist/File-DirWalk'
source=('http://search.cpan.org/CPAN/authors/id/J/JE/JENSL/File-DirWalk-0.5.tar.gz')
md5sums=('fe7691c3d81dfd9fdbf94e6b489cde1e')
sha512sums=('7f5329725035b7ae70ead89c25e01d026a16a30a02919570c533f22261791d511577e100684cc3099698cbba4e5809f0edba3520f6d70d007450ab7a0dafad8f')
_distdir="File-DirWalk-0.5"

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
