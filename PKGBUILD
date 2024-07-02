# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Conrtibutor: Luis Martinez <luis dot martinez at disroot dot org>

_pkgname="octofetch"
pkgname="${_pkgname}-bin"
pkgver=0.3.3
pkgrel=1
pkgdesc="GitHub stats fetch tool"
arch=('x86_64')
url="https://github.com/azur1s/${_pkgname}"
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl-1.1')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=(${url}/raw/${pkgver}/{README.md,LICENSE})
source_x86_64=("${_pkgsrc}::${url}/releases/download/${pkgver}/${_pkgname}")
sha256sums=('cdc18e51a9f605601433939192748866a58cb0db5367ca687bfa038b8f4dbd8b'
            '0b85b107bb5386b2b35372d2f64a8ccf5079149b239ade6bb3889753011a368c')
sha256sums_x86_64=('dba36c4578b86ce6413d075fb06d606a162a34941c5bd7b2d2542ca1ffbaf140')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"  "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
