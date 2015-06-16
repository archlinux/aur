# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-anyevent-inotify-simple'
pkgver='0.03'
pkgrel='1'
pkgdesc="monitor a directory tree in a non-blocking way"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-anyevent' 'perl-directory-scratch' 'perl-ev' 'perl-file-next' 'perl-linux-inotify2' 'perl-moose' 'perl-moosex-declare' 'perl-moosex-fileattribute' 'perl-moosex-types-path-class')
makedepends=()
checkdepends=('perl-test-exception')
url='http://search.mcpan.org/dist/AnyEvent-Inotify-Simple'
source=('http://search.mcpan.org/CPAN/authors/id/R/RO/ROBN/AnyEvent-Inotify-Simple-0.03.tar.gz')
md5sums=('7b401e8931d25338e2d155864f45c3a3')
sha512sums=('8b4bf9f4d527b0249b93a285d207470a22428e1584839d9d831ba59021b473d0bbb61aa916ed9e553dd3213be150202509332c24c794de49cef956225027b731')
_distdir="AnyEvent-Inotify-Simple-0.03"

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
