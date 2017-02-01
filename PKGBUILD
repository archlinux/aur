# Contributor: Phillip Smith <pkgbuild@phs.id.au>

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=perl-date-parse
pkgver=2.30
pkgrel=3
pkgdesc='Parse date strings into time values'
arch=('any')
url='http://search.cpan.org/~gbarr/TimeDate-2.30/'
license=('GPL' 'PerlArtistic')
depends=('perl' )
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/TimeDate-${pkgver}.tar.gz")
md5sums=('b1d91153ac971347aee84292ed886c1c')

build() {
  cd "$srcdir"/TimeDate-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir"/TimeDate-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
