# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: orhun <orhunparmaksiz@gmail.com>

_pkgname=gping
pkgname=${_pkgname}-bin
pkgver=1.16.1
pkgrel=1
pkgdesc="Ping, but with a graph"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/orf/${_pkgname}"
license=('MIT')
depends=('iputils')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
_pkgvsrc="${_pkgname}-v${pkgver}"
source=("${url}/releases/download/${_pkgvsrc}/${_pkgname}.1"
        "${url}/raw/${_pkgvsrc}/LICENSE"
        "${url}/raw/${_pkgvsrc}/readme.md")
source_x86_64=("${_pkgsrc}.tar.gz::${url}/releases/download/${_pkgvsrc}/${_pkgname}-Linux-x86_64.tar.gz")
source_aarch64=("${_pkgsrc}.tar.gz::${url}/releases/download/${_pkgvsrc}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("${_pkgsrc}.tar.gz::${url}/releases/download/${_pkgvsrc}/${_pkgname}-armv7-unknown-linux-gnueabihf.tar.gz")
sha256sums=('ee8eaf849ae5028f8986e994e4f1b5648a0b3d24a432beb64724584f035cbbd3'
            '9f9d97dd2f2ed799c1b77a94847f695c8378d6b040908cbdb7fdd58524e32ad1'
            '81555671c78897390407d4b8439d30feb8d536c4d794f293ec5bea17d47862f1')
sha256sums_x86_64=('b4b9108ac6214e2bf10e1ec8d0307a32aed9cc57c54d31c697e96ee89c492222')
sha256sums_aarch64=('066ce30c13ffc7ac3614bc153d314722f10361cbc9cb40701adb0056e431e274')
sha256sums_armv7h=('e704231d55767489f4db0024557e7607153047e98b9605a5f53dd62b7c1d8b2b')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}