# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Bestire
_pkgname=hostman
pkgname=${_pkgname}-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="A simple file host manager for various image hosting services"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('cjson' 'sqlite' 'openssl' 'curl' 'glibc')

changelog="changelog.md"

source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-${arch[0]}.tar.gz")
sha256sums_x86_64=('a269ca356c79ab53261aadcec9494263d5d716abe7fe26255ffb2688c4e98e33')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
