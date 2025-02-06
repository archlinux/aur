# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=fioncat
_pkgname=csync
pkgname=${_pkgname}-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="Share your clipboard between different devices"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}-unknown-linux-gnu.tar.gz")
sha256sums=('37eaee562feba2bd228c72458d686db925d33ff2f3f2527d9844eaee1196bd6a'
            '78f4774e0b40c88954871f2d970ab1c38e1f48cc529a6aed0b5cd7710f5a29b9')
sha256sums_x86_64=('cb7cdcb144bc074ad80505eabbadd73d6eedcb8919cfcb309559f06b06811e63')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
