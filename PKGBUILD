# Maintainer: Jonne Haß <me@mrzyx.de>
# Contributor: Justin Davis <jrcd83 at gmail>

_author="markstos"
_perlmod="CGI-Application"
pkgname='perl-cgi-application'
pkgver='4.50'
pkgrel='1'
pkgdesc="CGI::Application - Framework for building reusable web-apps"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.10.0' 'perl-html-template' 'perl-class-isa')
url='http://search.cpan.org/~$_author/$_perlmod-$pkgver/'
source=("http://search.cpan.org/CPAN/authors/id/M/MA/MARKSTOS/CGI-Application-$pkgver.tar.gz")
md5sums=('356595b6f12373f57243a7e605b9cd43')

build() {
  cd "$srcdir/$_perlmod-$pkgver"
  
  perl Build.PL --installdirs=vendor --destdir="$pkgdir"
  perl Build
}

check() {
  cd "$srcdir/$_perlmod-$pkgver"
  
  perl Build test
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  
  perl Build install
}
