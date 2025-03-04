# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="stepman"
pkgname="${_pkgname}-bin"
pkgver=0.17.2
pkgrel=1
pkgdesc="Manage decentralized StepLib Step (script) collections"
arch=('aarch64' 'x86_64')
url="https://github.com/bitrise-io/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-Linux-arm64")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-Linux-x86_64")
sha256sums=('a6f4e5eef34a61a1fe87cbc06109bf3d077b9eb7fa945d70c95c5643dea9ed0c'
            'a0379118157469b6a466bf070c8986ffbca0874d10bb4950e0c6018544914414')
sha256sums_aarch64=('2eacbac31f3a3c8249f23bddd6a3b61d40f9e8088c12b392fab714bcb0e620ef')
sha256sums_x86_64=('d73c1bc78f50ed8e5321c769b994abf103f7bc4be6d9ce6a154252fd133f2b6a')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
