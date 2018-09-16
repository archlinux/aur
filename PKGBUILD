# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=nfancurve
pkgname=${_pkgname}
pkgver=016
pkgrel=1
pkgdesc="A small and lightweight Bash script for using a custom fan curve in Linux for NVIDIA GPUs"
arch=("any")

url="https://github.com/nan0s7/nfancurve"
license=("GPL3")

depends=("bash" "nvidia" "nvidia-settings" "procps")
conflicts=("${_pkgname}-git")

install=${_pkgname}.install

source=(
    "${_pkgname}-${pkgver}::https://github.com/nan0s7/${_pkgname}/archive/v${pkgver}.tar.gz"
)
sha512sums=(
    "98a47ec6e8a8131b6dac2b287fb33577440457a11a4ea28a9fd53ec8568416776d3ec4bf37741ccdc06522b39ada876fe14c8829263802433d3dda3814558c98"
)

package() {
    cd "${_pkgname}-${pkgver}"
    
    install -m755 -D "temp.sh" "$pkgdir/usr/bin/nfancurve"
    install -m644 -D "config.sh" "$pkgdir/usr/share/doc/${_pkgname}/config.sh.example"
}
