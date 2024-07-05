# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: lmartinez-mirror
# Contributor: donbex <ap dot m at runbox dot com>

_pkgname="as-tree"
pkgname="${_pkgname}-bin"
pkgver=0.12.0
pkgrel=1
pkgdesc="Print a list of paths as a tree of paths"
arch=('x86_64')
url="https://github.com/jez/as-tree"
license=('custom:BOML-1.0')
depends=('glibc' 'gcc-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(${url}/raw/${pkgver}/{README,LICENSE}.md)
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux.zip")
sha256sums=('6acd0ebf5efd6da5cb3ebca3bb9d763c7367d45433bb93d47c34db64bff174e3'
            '8a1af140fdfbf5afd3df27f7e662f989c5b963a300020dfafce42033cae9e004')
sha256sums_x86_64=('adb3fa37c49bb137b772379a4c5e07c3ac9609871cd3058c376e32f9fb9ee434')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE.md"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
