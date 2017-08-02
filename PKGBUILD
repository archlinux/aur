# Maintainer: Eric Biggers <ebiggers3 at gmail dot com>

pkgname=fscrypt-git
pkgver=0.1.0.53.g1f29458
pkgrel=1
pkgdesc='A tool for managing Linux filesystem encryption'
arch=('x86_64' 'i686')
url='https://github.com/google/fscrypt'
license=('Apache')
makedepends=('git' 'go')
depends=('argon2' 'pam')
provides=('fscrypt')
source=('git://github.com/google/fscrypt.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/fscrypt"
	git describe --tags --long | tr - .
}

build() {
	cd "${srcdir}/fscrypt"
	make
}

package() {
	cd "${srcdir}/fscrypt"
	install -Dm755 fscrypt   "${pkgdir}/usr/bin/fscrypt"
	install -Dm644 README.md "${pkgdir}/usr/share/fscrypt/README.md"
}
