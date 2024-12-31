# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="klib"
_commit="29445495262cf34f4c3b82d3917ac83f3e1f3f58" # r394
pkgver="r394+g${_commit::7}"
pkgrel=1
pkgdesc="Standalone and lightweight C library"
arch=('any')
url="https://attractivechaos.github.io/klib"
_url="https://github.com/attractivechaos/${pkgname}"
license=('MIT')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz")
b2sums=('3d07fb2dbc02124bae408623fbd1b4a80c02c30599452a57e9fad044f113f43922f6abf9c3996653fa8b2df82ea7f52cc37e98f204b69cb75677e136b84e7b35')

package() {
  cd "${srcdir}/${_pkgsrc}"
  find . -maxdepth 1 -type f \( -name "*.c" -o -name "*.h" \) -exec \
    install -vDm644 "{}" "${pkgdir}/usr/include/${pkgname}/{}" \;
  find "cpp" -type f -exec install -vDm644 "{}" "${pkgdir}/usr/include/${pkgname}/{}" \;

  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
