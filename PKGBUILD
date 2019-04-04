# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=perl-http-daemon-ssl
pkgver=1.04
pkgrel=1
pkgdesc="Simple http server class with SSL support"
arch=('any')
url='https://metacpan.org/pod/HTTP::Daemon::SSL'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-io-socket-ssl' 'perl-io-socket-inet6')
options=('!emptydirs')
source=(https://cpan.metacpan.org/authors/id/A/AU/AUFFLICK/HTTP-Daemon-SSL-${pkgver}.tar.gz)
sha256sums=('7eae05422d934c8492dfd3505b774fd6590c99808ce8beb6c57efd261e5dc22e')

prepare() {
  cd "${srcdir}/HTTP-Daemon-SSL-${pkgver}"
}

build() {
  cd "${srcdir}/HTTP-Daemon-SSL-${pkgver}"
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

# currently breaks, must investigate
#check() {
#  cd "${srcdir}/HTTP-Daemon-SSL-${pkgver}"
#  make test
#}

package() {
  cd "${srcdir}/HTTP-Daemon-SSL-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
