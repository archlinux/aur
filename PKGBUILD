# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-string-trim-more
pkgver=0.03
pkgrel=1
pkgdesc="Various string trimming utilities"
arch=('any')
url="https://github.com/perlancar/perl-String-Trim-More"
license=('GPL' 'PerlArtistic')
depends=('perl')
source=("https://www.cpan.org/modules/by-module/String/String-Trim-More-${pkgver}.tar.gz")
sha512sums=('b9c1613bfe736f24b875bd1aaed485d0902ffa7f0e2a8ca65e8e735a37c32199008fca7de6dac5e37cb4aacbee8bf12f61731e0868dddea18620f471548c1493')

build() {
  cd "${srcdir}/String-Trim-More-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true
  make
}

check() {
  cd "${srcdir}/String-Trim-More-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/String-Trim-More-${pkgver}"

  make pure_install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
