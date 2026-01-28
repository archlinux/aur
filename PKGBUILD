# Maintainer: Evgeniy Alekseev

pkgname=plasma6-applets-awesome-widgets
_pkgname=awesome-widgets
pkgver=4.0.5
pkgrel=1
pkgdesc="Collection of minimalistic Plasmoids which look like Awesome WM widgets (ex-PyTextMonitor)"
arch=('x86_64')
url="https://arcanis.me/projects/awesome-widgets"
license=('GPL3')
depends=('plasma-workspace')
optdepends=("mpd: for music player monitor"
            "wireless_tools: wifi information")
makedepends=('cmake' 'extra-cmake-modules' 'python')
source=(https://github.com/arcan1s/awesome-widgets/releases/download/${pkgver}/${_pkgname}-${pkgver}-src.tar.xz)
install="$pkgname.install"
backup=('etc/xdg/plasma-dataengine-extsysmon.conf')

build () {
    cmake -B build -S "${_pkgname}" \
          -DCMAKE_BUILD_TYPE=Optimization \
          -DBUILD_FUTURE=ON \
          -DBUILD_TESTING=OFF
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

sha256sums=('c029f22314d88d03158a776b447165c5e35f794abbe3be74d2ec789b217f2686')
