# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="oxker"
pkgname="${_pkgname}-bin"
pkgver=0.9.0
pkgrel=1
pkgdesc="A simple TUI to view & control Docker containers"
arch=('x86_64' 'aarch64' 'armv6h')
url="https://github.com/mrjackwills/${_pkgname}"
license=('MIT')
depends=('docker')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_x86_64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_aarch64.tar.gz")
source_armv6h=("${_pkgsrc}-armv6h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_armv6.tar.gz")
sha256sums=('b6435330782cbc7ef7313066232f7c03b16aaad7eca9727e0fbb2bb6422f6456'
            'b73cb1c664857dc71c358b7127f3601be7d625fa97fa2d7e3b1e09381e4d98f0')
sha256sums_x86_64=('0d73ae234299ced19bb2b87f2de2b6c814ee3e9eb1ad1f6406acdcd156f809ea')
sha256sums_aarch64=('5e5160a8fa70371b06b44d30ddbb167099a6cb0262fa6457cd411f742d6be529')
sha256sums_armv6h=('4c51bc716f0ba4d8fb883f5fa532896765794c066e34327ebad318cc3d7d9a9a')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"         "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
