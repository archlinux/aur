# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=framework-sensors-git
_pkgname=framework-sensors
pkgdesc="Sensors configuration for the framework 16."
pkgver=0.0.0.r0.5f090323
pkgrel=1
arch=('any')
url="https://github.com/FrameworkComputer/lm-sensors"
license=('GPL2')
conflicts=('framework-sensors')
provides=('framework-sensors')
depends=(
    'lm_sensors'
)
makedepends=(
    'git'
)

pkgver() {
    cd "$srcdir/$_pkgname"
    echo "0.0.0.r0.$(git describe --always)"
}

source=(
    "$_pkgname::git+https://github.com/FrameworkComputer/lm-sensors#branch=framework"
)

sha256sums=(
    "SKIP"
)

package() {
    install -D -m0644 "$srcdir/$_pkgname/configs/Framework/Framework16-AMD.conf" "$pkgdir/etc/sensors.d/Framework16-AMD.conf"
}
