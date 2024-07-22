# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: orhun <orhunparmaksiz@gmail.com>

_pkgname="gping"
pkgname="${_pkgname}-bin"
pkgver=1.17.3
pkgrel=1
pkgdesc="Ping, but with a graph"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/orf/${_pkgname}"
license=('MIT')
depends=('glibc' 'gcc-libs' 'iputils')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/${_pkgname}-v${pkgver}/readme.md"
        "LICENSE-${pkgver}::${url}/raw/${_pkgname}-v${pkgver}/LICENSE"
        "${_pkgname}-${pkgver}.1::${url}/releases/download/${_pkgname}-v${pkgver}/${_pkgname}.1")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/${_pkgname}-v${pkgver}/${_pkgname}-Linux-x86_64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/${_pkgname}-v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${url}/releases/download/${_pkgname}-v${pkgver}/${_pkgname}-armv7-unknown-linux-gnueabihf.tar.gz")
sha256sums=('5e165848257cef4c0ae4b95494c4513d82e094a152c175fc200356000d7e50cb'
            '9f9d97dd2f2ed799c1b77a94847f695c8378d6b040908cbdb7fdd58524e32ad1'
            '14f11fd40bd49999ab3c7da2325bdcdf5b3a85e7852266d73aa0dfb1d1c6073e')
sha256sums_x86_64=('3ef26d0973baaf96fd61178fba2c7848cc628d27258688e0cc0b25ac7ba3b233')
sha256sums_aarch64=('59ac6613e2c27956552dada8012575736cf2d3b57e7975cd2287b2ac9aabb9d3')
sha256sums_armv7h=('4b1161af0e1fa243ef56b664b4c0716227e0986ff8f38f6a175c5fd1f33d08e3')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}"             "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md"     "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"       "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${_pkgname}-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
