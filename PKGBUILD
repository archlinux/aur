# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="monocle"
pkgname="${_pkgname}-bin"
pkgver=0.7.2
pkgrel=1
pkgdesc="See through all BGP data with a monocle"
arch=('x86_64' 'aarch64')
url="https://github.com/bgpkit/${_pkgname}"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('a06afe60a7335190486d4ba605223c7265c775f61b12336453652a730049312f'
            '2f7fe2af03db380114c5894a77181791be23b2cb12035669dfb38c09c47e104c')
sha256sums_x86_64=('2c25f6e44a4f33d8f7eaec052d5f9ca0fc79dc89976de15ba8c21474309b6e9b')
sha256sums_aarch64=('b6002b92afd89cdf0240d2fc8a1fb19ef22c98525f2c75519a5c12dbc995dbe4')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
