# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=nfancurve
pkgname=${_pkgname}-git
pkgver=v016.r12.gea6fcf8
pkgrel=2
pkgdesc="A small and lightweight Bash script for using a custom fan curve in Linux for NVIDIA GPUs"
arch=("any")
url="https://github.com/nan0s7/nfancurve"
license=("GPL3")

depends=("bash" "nvidia" "nvidia-settings" "procps")
makedepends=("git")
conflicts=("${_pkgname}")

install=${_pkgname}.install
source=("${_pkgname}::git+https://github.com/nan0s7/${_pkgname}.git")
sha512sums=('SKIP')


pkgver() {
    cd "${_pkgname}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${_pkgname}"

    install -m755 -D "temp.sh" "$pkgdir/usr/bin/nfancurve"
    install -m644 -D "config" "$pkgdir/usr/share/doc/${_pkgname}/config.example"
}
