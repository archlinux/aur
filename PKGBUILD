# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="clai"
pkgname="${_pkgname}-bin"
pkgver=1.4.8
pkgrel=1
pkgdesc="Command line artificial intelligence - Multi-vendor generation in your terminal"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/baalimago/${_pkgname}"
license=('MIT')
depends=('glibc')
optdepends=('glow: for formatted markdown output when querying text responses')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "EXAMPLES-${pkgver}.md::${url}/raw/v${pkgver}/EXAMPLES.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_linux-amd64_v${pkgver}")
source_i686=("${_pkgsrc}-i686::${url}/releases/download/v${pkgver}/${_pkgname}_linux-386_v${pkgver}")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_linux-arm64_v${pkgver}")
sha256sums=('f686d13c11b0416802777e5dc5049c472ecf764ce153681617e88854959a415d'
            '49521c29eb1889889064b16a4fce2e79abb54b520a1545000f22f71678d53046'
            'bc5378230a80daace8ac9ea68f538fb33997fd2abf0fa5d91905365b6b8924dc')
sha256sums_x86_64=('5afe19996a3fb0101ec99341fc1508df08fb47f906ab9134edb3d278710e578b')
sha256sums_i686=('af236f75846227d3c31bf0b700c4e2a605707f63547e9c7056d642d69f66d4c5')
sha256sums_aarch64=('ba1464f774ea22ce113cb725826525607bd209f0b76e7d36cd83b1ecf25e16bc')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}"   "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "EXAMPLES-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/EXAMPLES.md"
  install -Dm644 "LICENSE-${pkgver}"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
