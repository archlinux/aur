# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=fioncat
_pkgname=csync
pkgname=${_pkgname}-bin
pkgver=0.6.1
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
            '8a3e91542dc90ef8b417d8f26eac30e64e0788976a82e4a2560be0e33d3d2800')
sha256sums_x86_64=('363c476df07b7e24dae322f475ea4b155ed5185a6b98c6ee2201c6d26390da6b')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "csyncd" "${pkgdir}/usr/bin/csyncd"
  install -Dm755 "csynctl" "${pkgdir}/usr/bin/csynctl"
  install -Dm755 "csync-server" "${pkgdir}/usr/bin/csync-server"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
