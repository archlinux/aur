# Maintainer: gigas002 <gigas002@pm.me>

pkgname=sweet-kvantum-theme-git
_pkgname=sweet
pkgver=r248.802e805
pkgrel=1
pkgdesc="Sweet kvantun theme"
arch=('x86_64')
url="https://github.com/EliverLara/$_pkgname"
license=('GPL3')
groups=()
makedepends=('git')
depends=('kvantum-qt5')
checkdepends=()
optdepends=()
provides=("sweet-kvantum-theme-git")
conflicts=('kvantum-theme-sweet-git')
source=("git+$url.git#branch=nova")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $_pkgname/kde
    install -d "$pkgdir"/usr/share
    cp -r Kvantum "$pkgdir"/usr/share
}
