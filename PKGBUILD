# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-music-tag'
pkgver='0.4103'
pkgrel='1'
pkgdesc="Interface for collecting information about music files."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-config-options>=0.07' 'perl-datetimex-easy>=0.088' 'perl-digest-sha1>=2.11' 'perl-file-slurp>=1' 'perl-readonly>=1')
makedepends=()
url='http://search.cpan.org/dist/Music-Tag'
source=('http://search.cpan.org/CPAN/authors/id/E/EA/EALLENIII/Music-Tag-0.4103.tar.gz')
md5sums=('1f63a539beb57c38723bc431dc12a962')
sha512sums=('425d6b17f8a3735681e7c89999abce45b7f8f071acb3017f962cd15c7d275383dbed3ad58d6248125d9901635495336babb1c8a665752453b4d0cd82d6017d0a')
_distdir="Music-Tag-0.4103"

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
