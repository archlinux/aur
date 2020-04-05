# Maintainer: Rene Hollander <mail@renehollander.at>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=nfancurve
pkgname=${_pkgname}
pkgver=019.3
pkgrel=2
pkgdesc="A small and lightweight Bash script for using a custom fan curve in Linux for NVIDIA GPUs"
arch=("any")
url="https://github.com/nan0s7/nfancurve"
license=("GPL3")

depends=("bash" "nvidia-utils" "nvidia-settings" "procps")
conflicts=("${_pkgname}-git")

backup=('etc/nfancurve.conf')
install=${_pkgname}.install
source=("${_pkgname}-${pkgver}::https://github.com/nan0s7/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('ef12d7d873726bb342663c9b212277afb4ef4837ef1399007e37412927365057d4cc2aab16d3fee9ece71c1c8d204e57cc036626b7f5d059f51141f9496b9d15')


package() {
    cd "${_pkgname}-${pkgver}"

    install -Dm755 "temp.sh" "$pkgdir/usr/bin/nfancurve"
    install -Dm644 "config" "$pkgdir/etc/nfancurve.conf"
    install -Dm644 "nfancurve.service" "$pkgdir/usr/lib/systemd/user/nfancurve.service"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 "USAGE.md" "$pkgdir/usr/share/doc/${_pkgname}/USAGE.md"
    install -Dm644 "LICENCE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
