# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgauthor=bitrise-io
_pkgname=stepman
pkgname="${_pkgname}-bin"
pkgver=0.24.1
pkgrel=1
pkgdesc="Manage decentralized StepLib Step (script) collections"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-${arch[0]}::${url}/releases/download/v${pkgver}/${_pkgname}-Linux-${_barch[0]}")
source_aarch64=("${_pkgsrc}-${arch[1]}::${url}/releases/download/v${pkgver}/${_pkgname}-Linux-${_barch[1]}")

sha256sums=('a6f4e5eef34a61a1fe87cbc06109bf3d077b9eb7fa945d70c95c5643dea9ed0c'
            'a0379118157469b6a466bf070c8986ffbca0874d10bb4950e0c6018544914414')
sha256sums_x86_64=('1861dfdd6ed97b46c4ea80a0d4cb9870e10b6da65984ee0b146251358dd85775')
sha256sums_aarch64=('8ba04786e8331de33fe9e6f2e7cbd359fee1d348f1c562018ced1f22b777bce5')

package() {
  cd "${srcdir}" || exit

  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"

  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
