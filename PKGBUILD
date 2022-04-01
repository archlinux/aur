# Maintainer: Tomás Duarte <alfarrofo@gmail.com>
_pkgname=projectmanager
pkgname=${_pkgname}-git
pkgver=0.0.1
pkgrel=1
pkgdesc="Create and manage diferent projects!"
arch=('x86_64')
url="https://github.com/MustachedSquid/ProjectManager"
license=('MIT')
depends=('bash')
makedepends=('git')
optdepends=('git: git support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${pkgname}"
    make DESTDIR="$pkgdir" install
}

