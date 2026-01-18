# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=casey
_pkgname=filepack
pkgname=${_pkgname}-bin
pkgver=0.0.8
pkgrel=1
pkgdesc='Command-line file hashing and verification utility written in Rust'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
arch=('x86_64' 'aarch64')
license=('custom:CC0')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${arch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${arch[1]}-unknown-linux-musl.tar.gz")
sha256sums=('a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499'
            '1dc86b68891409e479f20de4955a441a05c559a44c3522edcdd3914863a7b257'
            '6f71df25afaa3968777b9fe512f28ae263a254c12bac9ff6850458f29e9c39bb')
sha256sums_x86_64=('a6d13f6a8b1ccdd8263886eb17cc6fc4499765dc7cd0d72eec11f8d2ff38f716')
sha256sums_aarch64=('2bbe44255950ddc395f2ec1ee2963c7a42b63225fd7b8027c0fbc2f642c513ee')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
