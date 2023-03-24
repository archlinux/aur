# Maintainer: Andrés J. Díaz <ajdiaz@ajdiaz.me>

pkgname=nsd-exporter
_pkgname=nsd_exporter
pkgver=0.3.1
pkgrel=1
pkgdesc='Prometheus exporter for NSD (Name Server Daemon)'
arch=('x86_64')
url='https://github.com/optix2000/nsd_exporter'
license=('BSD 3-Clause License')
source=("https://github.com/optix2000/nsd_exporter/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=(
  '740d659a24c014760e8ac7fc1aec2c93c4aa7258eca9de608e1c838b67f23d90cd5fba3b92609dfc2229c2500d86b07457ff3ca8e7cf5031e4697e4c873657b6'
)

build() {
  cd "${_pkgname}-${pkgver}" && go build
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin" nsd_exporter
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

# vim: ts=2 sw=2 et:
