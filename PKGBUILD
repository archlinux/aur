# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jpillora
_pkgname=cloud-torrent
pkgname=${_pkgname}-bin
pkgver=0.9.4
pkgrel=1
pkgdesc='Cloud Torrent: a self-hosted remote torrent client'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
license=('MIT')

conflicts=("${_pkgname}")
provides=("${_pkgname}")

options=('!strip')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[0]}.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[1]}.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[2]}.gz")

sha256sums=('10ede613cce81dc5381ec9c1a08dcfdcd425d2a186a3efb25231ee3ba308585a'
            '41e7a0be692d5cd13cdd2052d90830b0f0af4302d2092c522e4a437807ca7157')
sha256sums_x86_64=('ef8b5e21730d50a962af8cf7bbc46a6c46aa8ed3285ee39c1a9728ccee67f95a')
sha256sums_i686=('916303709b84b3394e864e78bb1f28c759bc79cd554ff87ad73d28d454001ec8')
sha256sums_aarch64=('651f6793f7bcc3a3668808d8ccb4104b0746794995397fa24f8d8f9238522254')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
