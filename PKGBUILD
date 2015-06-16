# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-git-cpan-patch'
pkgver='2.0.3'
pkgrel='1'
pkgdesc="Patch CPAN modules using Git"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-archive-any' 'perl-archive-extract' 'perl-backpan-index' 'perl-class' 'perl-cpan-parsedistribution' 'perl-cpanplus' 'perl-datetime' 'perl-file-chdir' 'perl-file-chmod' 'perl-git-repository' 'perl-git-repository-plugin-autoload' 'perl-list-pairwise' 'perl-metacpan-api' 'perl-method-signatures-simple>=1.07' 'perl-moose' 'perl-moosex-app>=1.21' 'perl-moosex-role-tempdir' 'perl-moosex-semiaffordanceaccessor' 'perl-path-class' 'perl-libwww' 'perl>=5.10.1' 'git')
makedepends=()
checkdepends=('perl-test-mockobject')
url='http://search.mcpan.org/dist/Git-CPAN-Patch'
source=('http://search.mcpan.org/CPAN/authors/id/Y/YA/YANICK/Git-CPAN-Patch-2.0.3.tar.gz')
md5sums=('38fd1c6a78c0e3f090ddd90b9d374e48')
sha512sums=('951eaba4f3940795041265515fa610d40f172477086c5cb930732b2d126cf9fb9f6657814b3535d5ef1017e1403340e97aac7a2349c7bad9cd3b8f11589a9865')
_distdir="Git-CPAN-Patch-2.0.3"

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
