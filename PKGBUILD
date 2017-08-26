# Maintainer: Eric Biggers <ebiggers3 at gmail dot com>

pkgname=fscryptctl-git
pkgver=0.0.r8.1842856
pkgrel=1
pkgdesc='Small C tool for Linux filesystem encryption'
arch=('x86_64' 'i686')
url='https://github.com/google/fscryptctl'
license=('Apache')
makedepends=('git')
depends=('glibc')
provides=('fscryptctl')
source=('git://github.com/google/fscryptctl.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/fscryptctl"
	printf "0.0.r%d.%s\n" $(git rev-list HEAD --count) \
			      $(git rev-parse --short HEAD)
}

build() {
	cd "${srcdir}/fscryptctl"
	make
}

package() {
	cd "${srcdir}/fscryptctl"
	install -Dm755 fscryptctl "${pkgdir}/usr/bin/fscryptctl"
	install -Dm644 README.md "${pkgdir}/usr/share/fscryptctl/README.md"
}
