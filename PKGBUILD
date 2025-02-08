# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=fioncat
_pkgname=csync
pkgname=${_pkgname}-bin
pkgver=0.6.0
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
            'bd80f0c7b451af2b299ca4cfff4a8bb18d35c142674b6736a3a6ac2a2dc6229a')
sha256sums_x86_64=('260ceb13077c16aea566a03018ea407f7aa18d0c0fb6b461977581bc9a7ecac9')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "csyncd" "${pkgdir}/usr/bin/csyncd"
  install -Dm755 "csynctl" "${pkgdir}/usr/bin/csynctl"
  install -Dm755 "csync-server" "${pkgdir}/usr/bin/csync-server"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
