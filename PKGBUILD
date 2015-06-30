# Maintainer: Thore Bunde <root@netpimp.de>

pkgname=pam_captcha
pkgver=1.5
pkgrel=7
pkgdesc='A Visual text-based CAPTCHA challenge module for PAM/SSH Logins'
url='http://www.semicomplete.com/projects/pam_captcha/'
arch=('i686' 'x86_64')
license=('BSD')
depends=('pam' 'figlet')
install=${pkgname}.install
source=("http://semicomplete.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
sha256sums=('30b629fae019b5a0a746c5235597048a5e896c9cd9f5e47f8a0cf75d633c5317')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -D -m0755 pam_captcha.so ${pkgdir}/usr/lib/security/pam_captcha.so
}

