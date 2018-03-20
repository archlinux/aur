# Maintaienr: Niklas <dev@n1klas.net>
# Contributor: kevku <kevku@gmx.com>

pkgname=kodi-addon-inputstream-adaptive-18-git
pkgver=r232.9af2121
pkgrel=1
pkgdesc="InputStream client for adaptive streams for Kodi 19"
arch=('x86_64' 'i686')
url="https://github.com/peak3d/inputstream.adaptive"
license=('GPL2')
makedepends=('kodi-dev' 'cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('kodi-addon-inputstream-adaptive-git::git+https://github.com/peak3d/inputstream.adaptive.git')
md5sums=('SKIP')

pkgver() {
        cd "${srcdir}/${pkgname}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd "${srcdir}/${pkgname}"
        cmake -DCMAKE_INSTALL_PREFIX=/usr
        make
}

package() {
        cd "${srcdir}/${pkgname}"
        make DESTDIR="${pkgdir}" install
}
