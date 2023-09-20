# Maintainer: Rasmus Steinke <rasi at xssn dot at>

pkgname=clerk-python-git
_pkgname=clerk
pkgver=1092.ea4d617
pkgrel=1
provides=('clerk')
pkgdesc="rofi driven mpd album/track chooser"
arch=('any')
url='https://github.com/carnager/clerk'
license=('GPL')
depends=('python-mpd2' 'python-msgpack' 'python-toml')
install=clerk-python-git.install
makedepends=('git')
source=('git+https://github.com/carnager/clerk')

pkgver() {
    cd ${_pkgname}
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -D -m 755 ${srcdir}/clerk/clerk.py "${pkgdir}/usr/bin/clerk.py"
}
md5sums=('SKIP')
