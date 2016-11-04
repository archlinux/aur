# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Andrew Kraut <akraut@gmail.com>
pkgname=urbit
pkgver=0.4
pkgrel=2
epoch=0
pkgdesc="a secure peer-to-peer network of personal servers, built on a clean-slate system software stack"
arch=('i686' 'x86_64')
url="https://urbit.org/"
license=('MIT')
depends=('libsigsegv' 'gmp' 'openssl' 'ncurses' 'curl')
makedepends=('gcc' 'automake' 'autoconf' 'ragel' 'cmake' 're2c' 'libtool')
conflicts=('urbit-git')
options=()
source=("${pkgname}-${pkgver}.tar.gz::https://media.urbit.org/dist/src/${pkgname}-${pkgver}.tar.gz")

build() {
	cd "${pkgname}-${pkgver}"
	make all
}

package() {
	cd "${pkgname}-${pkgver}"
	install -D -m755 bin/urbit ${pkgdir}/usr/bin/urbit
	install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
md5sums=('7a403e9a03e32c98ea2fa00654abf85a')
