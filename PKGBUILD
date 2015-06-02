# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=perl-geo-google
_cpanname=Geo-Google
pkgver=0.05
pkgrel=2
pkgdesc="Perform geographical queries using Google Maps"
url="http://search.cpan.org/~allenday/$_cpanname-$pkgver/"
depends=('perl' 'perl-json')
arch=('i686' 'x86_64')
license=('GPL')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/A/AL/ALLENDAY/$_cpanname-$pkgver.tar.gz")
md5sums=('9da8c911f3576c5bba942fdd5b367b90')

_dest=/usr/lib/perl5/vendor_perl/

build() {
  cd "$srcdir"/$_cpanname-$pkgver

  eval $(perl -V:archname)

  perl Makefile.PL \
      INSTALLARCHLIB=$_dest/${archname} \
      INSTALLSITELIB=$_dest \
      INSTALLSITEARCH=$_dest/${archname}

  make
}

package() {
  cd "$srcdir"/$_cpanname-$pkgver

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
