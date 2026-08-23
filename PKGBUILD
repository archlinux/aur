# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jpillora
_pkgname=binid
pkgname=${_pkgname}-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='Cryptographic binary identification — ed25519-sign executables with arbitrary metadata'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
license=('MIT')

conflicts=("${_pkgname}")
provides=("${_pkgname}")

options=('!strip')

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[1]}.tar.gz")

sha256sums_x86_64=('9adbd255577721808332258c541a62dcbbac0985a5b16b72195150497217f936')
sha256sums_aarch64=('63c9fa1797f6f0fc4e60b95d801bda33b5f80e9be7b2db8072fd646f7bc7d488')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
