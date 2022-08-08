# Maintainer: Rene Hollander <mail@renehollander.at>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=nfancurve
pkgname=${_pkgname}
pkgver=019.6.1
pkgrel=1
pkgdesc="A small and lightweight Bash script for using a custom fan curve in Linux for NVIDIA GPUs"
arch=("any")
url="https://github.com/nan0s7/nfancurve"
license=("GPL3")

depends=("bash" "nvidia-utils" "nvidia-settings" "procps")
conflicts=("${_pkgname}-git")

backup=('etc/nfancurve.conf')
install=${_pkgname}.install
source=(
  "${_pkgname}-${pkgver}::https://github.com/nan0s7/${_pkgname}/archive/v${pkgver}.tar.gz"
)
sha512sums=(
  '96ee340f40bab5e65d86ddd6c3db68833f1178720542ee5065fd0fb38d86eb763226eba01806adef83956edc9614bc46c2347edb194c75d73f8ff1f23ca7307c'
)


package() {
    cd "${_pkgname}-${pkgver}"

    install -Dm755 "temp.sh" "$pkgdir/usr/bin/nfancurve"
    install -Dm644 "config" "$pkgdir/etc/nfancurve.conf"
    install -Dm644 "nfancurve.service" "$pkgdir/usr/lib/systemd/user/nfancurve.service"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 "USAGE.md" "$pkgdir/usr/share/doc/${_pkgname}/USAGE.md"
    install -Dm644 "LICENCE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
