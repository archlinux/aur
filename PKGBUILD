pkgname=cherry-kde-git
pkgver=1.6.r6.gf464d54
pkgrel=1
pkgdesc="Clean, Flat, Δ Theme for KDE Plasma Desktop"
arch=('any')
url="https://github.com/nullxception/cherry-kde"
license=('GPL3')
optdepends=('kvantum-qt5: For the Qt application style')
makedepends=('git')
provides=("cherry-kde-theme")
conflicts=("cherry-kde-theme")
options=(!strip)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd "${pkgname}"
    ./install.sh --prefix="${pkgdir}/usr" --clear-cache=false
}
