# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname="udpreplay"
pkgname="${_pkgname}-bin"
pkgver=1.0.0
pkgrel=1
pkgdesc="Replay UDP packets from a pcap file"
arch=('x86_64')
url="https://github.com/rigtorp/${_pkgname}"
license=('MIT')
options=('!strip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-x64-linux-static")
sha256sums=('37973b78cd556b92eee1f2050e1ebebe49324575b4c41602527a56c7daef8fc5'
            'df0e31127f0e68b94da98960cbfafdbfbb3b79638cf483bf833256b216921dd3')
sha256sums_x86_64=('21d759bc1baee2d23ec7116c274b7f31b819f1d6f16e048f1dc75bb1c3b2f06f')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
