# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-plerd'
pkgver='1.811'
pkgrel='1'
pkgdesc="Ultralight blogging with Markdown and Dropbox"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-app-daemon>=0' 'perl-capture-tiny>=0' 'perl-data-guid>=0' 'perl-datetime>=0' 'perl-datetime-format-w3cdtf>=0' 'perl-file-changenotify>=0' 'perl-file-homedir>=0' 'perl-html-socialmeta>=0.72' 'perl-html-strip>=0' 'perl-mojolicious>=0' 'perl-moose>=0' 'perl-path-class>=0' 'perl-readonly>=0' 'perl-template-toolkit>=0' 'perl-text-multimarkdown>=0' 'perl-try-tiny>=0' 'perl-uri>=0' 'perl-web-mention>=0.6' 'perl-yaml>=0')
makedepends=()
url='https://metacpan.org/release/Plerd'
source=('https://cpan.metacpan.org/authors/id/J/JM/JMAC/Plerd-1.811.tar.gz')
md5sums=('f221e026281c8ca1591d29c62da9368c')
sha512sums=('b0358bc2fb1ab0c64017db7b2a906bb055f849cca784c4cc4292768640a4ba7a5662e70878e25c48d81485cebc010e1967ea5e5c7850e7c33c6a95d750b9692f')
_distdir="Plerd-1.811"

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
