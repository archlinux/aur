# Maintainer: Ilya V. Matveychikov <matvejchikov(at)gmail(dot)com>

_pkgname=jwasm
pkgname=jwasm-git
pkgver=latest
pkgrel=1
pkgdesc="JWasm fork (git) PKGBUILD file."
url="http://jwasm.info"
arch=('x86_64' 'i686')
license=('SOWPL')
depends=('git')
optdepends=()
makedepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
source=("$_pkgname::git+https://github.com/jwasm/jwasm.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/$_pkgname"
	git describe --always
}

build() {
	cd "${srcdir}/$_pkgname"
	make -f GccUnix.mak
}

package() {
	cd "${srcdir}/$_pkgname"
	install -Dm644 License.txt "${pkgdir}/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm755 GccUnixR/jwasm "${pkgdir}/usr/bin/jwasm"
}
