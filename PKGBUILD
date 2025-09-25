# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Daniele Basso <daniele05 dot bass at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgauthor='melbahja'
_pkgname='got'
pkgname="${_pkgname}-bin"
pkgver=0.7.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc='CLI tool to download large files faster than cURL and Wget'
arch=('x86_64' 'armv6h' 'aarch64' 'i686')
_barch=('amd64' 'armv6' 'arm64' '32bit')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}" w"${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}_${arch[0]}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_Linux_${_barch[0]}.tar.gz")
source_armv6h=("${_pkgname}-${pkgver}-${arch[1]}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_Linux_${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-${arch[2]}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_Linux_${_barch[2]}.tar.gz")
source_i686=("${_pkgname}-${pkgver}-${arch[3]}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_Linux_${_barch[3]}.tar.gz")

sha256sums=('93d6ab38739b203c36a2a44f450e28c44d1aa4bc4f96d1cbf233f86026c592bc'
            'e027923924cff67212357a5672bf38b772511b651049e1fe2048cf39a320905e')
sha256sums_x86_64=('b8a31b3e7de91f150cb87ed1e22bd2313bba06653add3b0342108cb4fcac9549')
sha256sums_armv6h=('37d99890495c9fd04458115167cbdc6ab7ed70413762220b824cc9f5984b2c52')
sha256sums_aarch64=('c14a0686c47e9f9eb68aa8c40fc45bcfefbec1ca1b5b22db607166148236c83a')
sha256sums_i686=('da57a36dc8fb193eb558528832f399c0f1b0d022aa110556b3853b34873dd0ca')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm755 "w${_pkgname}" -t "${pkgdir}/usr/bin"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
