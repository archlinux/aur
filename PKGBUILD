# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-plerd'
pkgver='1.820'
pkgrel='1'
pkgdesc="Ultralight blogging with Markdown and Dropbox"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-app-daemon>=0' 'perl-capture-tiny>=0' 'perl-data-guid>=0' 'perl-datetime>=0' 'perl-datetime-format-w3cdtf>=0' 'perl-file-changenotify>=0' 'perl-file-homedir>=0' 'perl-html-socialmeta>=0.72' 'perl-html-strip>=0' 'perl-json>=0' 'perl-mojolicious>=0' 'perl-moose>=0' 'perl-moosex-types-uri>=0' 'perl-path-class>=0' 'perl-readonly>=0' 'perl-template-toolkit>=0' 'perl-text-multimarkdown>=0' 'perl-try-tiny>=0' 'perl-uri>=0' 'perl-web-mention>=0.703' 'perl-yaml>=0' 'perl-libwww>=0')
makedepends=()
checkdepends=('perl-test-warn>=0')
url='https://metacpan.org/release/Plerd'
source=('https://cpan.metacpan.org/authors/id/J/JM/JMAC/Plerd-1.820.tar.gz')
md5sums=('ac8d57da4329d7a78874b64bfa8a3a65')
sha512sums=('375c164483aa50db34f40a18050da8ae47679c84484f606f3e8588ae9ebaea627d6de09aedae59e73454074ab2c34f1b93602842e6b5ebaa669aeb91823e9317')
_distdir="Plerd-1.820"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
