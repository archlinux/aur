# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# Contributor:  TDY <tdy@gmx.com>
# Contributor: Max Nemeth <max.nemeth@gmail.com>

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=perl-config-inifiles
pkgver=2.83
pkgrel=2
pkgdesc="A Perl module for reading .ini-style configuration files"
arch=('any')
url="http://search.cpan.org/dist/Config-IniFiles/"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-list-moreutils')
makedepends=('perl-module-build')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/Config-IniFiles-$pkgver.tar.gz")
md5sums=('c34156374d3842289e537aaafa7b937f')

build() {
  cd "$srcdir"/Config-IniFiles-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir"/Config-IniFiles-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
