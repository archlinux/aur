# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=plasma5-applets-bandwidth-monitor
pkgver=2.0
pkgrel=3
pkgdesc="Plasma 5 applet that displays the currently used network bandwidth."
arch=("any")
url="https://gitlab.com/Scrumplex/plasma-applet-bandwidth-monitor"
license=("GPL2")

depends=("plasma-workspace")
makedepends=("git" "cmake" "extra-cmake-modules")

source=("https://gitlab.com/Scrumplex/plasma-applet-bandwidth-monitor/-/archive/${pkgver}/plasma-applet-bandwidth-monitor-${pkgver}.tar.gz")
sha512sums=('74adf796feede3e40feaedd982e7bf4f7f625701ca92c0edc1c5bc388009c73bb2f382fbec09644bbc58fa147c9e67ea455f4c30e099539370802a4d75ae1afd')


build() {
    cd "plasma-applet-bandwidth-monitor-${pkgver}"

    cmake -DCMAKE_INSTALL_PREFIX=/usr 
    make
}

package() {
    cd "plasma-applet-bandwidth-monitor-${pkgver}"

    make DESTDIR="$pkgdir/" install
}
