# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="monocle"
pkgname="${_pkgname}-bin"
pkgver=0.6.0
pkgrel=1
pkgdesc="See through all BGP data with a monocle"
arch=('x86_64' 'aarch64')
url="https://github.com/bgpkit/${_pkgname}"
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${url}/raw/v${pkgver}/README.md"
        "${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('28ae217d3e04c30e7c0c99bdc5b90231075aabe2edafb1cd1203858fba0604df'
            '2f7fe2af03db380114c5894a77181791be23b2cb12035669dfb38c09c47e104c')
sha256sums_x86_64=('df8e5336b7ffd3429678ffdf5bb5cb001895bb4da2ffadbee7748f0ee8991988')
sha256sums_aarch64=('2d740716832d420fa682947d68b16b144382c913810d33e408b02672e0db4469')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
