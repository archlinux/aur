# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="oxker"
pkgname="${_pkgname}-bin"
pkgver=0.10.4
pkgrel=1
pkgdesc="A simple TUI to view & control Docker containers"
arch=('aarch64' 'armv6h' 'x86_64')
url="https://github.com/mrjackwills/${_pkgname}"
license=('MIT')
depends=('docker')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_aarch64.tar.gz")
source_armv6h=("${_pkgsrc}-armv6h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_armv6.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_x86_64.tar.gz")
sha256sums=('428e08b82034b88eb51547763a9f96ea16b8dfea75213b468d5367cef1f3e1fb'
            'b73cb1c664857dc71c358b7127f3601be7d625fa97fa2d7e3b1e09381e4d98f0')
sha256sums_aarch64=('927390771c28f2816b1257f2e3158670e79e4d3ed58f721c656e7e65d2571342')
sha256sums_armv6h=('e36308dc36adaa1d5e8705dde9bc54a7d180902a126870d90d52b46f6189bee6')
sha256sums_x86_64=('4bdb4bc6c0635ed8c1e3b7ac0382d8bbf87b959dabdf1bca932234703c8893a7')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"          "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
