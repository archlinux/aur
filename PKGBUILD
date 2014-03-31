# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Captcha-reCAPTCHA-Mailhide
cpanauthor=ANDYA
pkgname=perl-captcha-recaptcha-mailhide
pkgver=0.94
pkgrel=1
pkgdesc="Perl Captcha::reCAPTCHA::Mailhide CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl' 'perl-crypt-rijndael' 'perl-html-tiny')
source=("http://search.cpan.org/CPAN/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('904975cc274e6890df1348376d3d7ae99c2980f7e6f7a3fae4d518746686200f')

build() {
	 cd "${srcdir}/${cpaname}-${pkgver}"
	 perl Makefile.PL
	 make
}

check() {
	 cd "${srcdir}/${cpaname}-${pkgver}"
	 make test
}

package () {
	 cd "${srcdir}/${cpaname}-${pkgver}"
	 make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
