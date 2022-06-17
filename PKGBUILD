# Maintainer: Tomás Duarte <tomas@mustachedsquid.com>
_pkgname=ink-scripts
pkgname=${_pkgname}-git
pkgver=r15.9d59087
pkgrel=2
pkgdesc="Utility and fun scripts"
arch=('any')
url="https://git.sr.ht/~mustachedsquid/ink-scripts"
license=('BSD')
depends=('bash' 'curl' 'dmenu')
makedepends=('git')
optdepends=('git: git support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${pkgname}"
    make DESTDIR="$pkgdir" install
}

