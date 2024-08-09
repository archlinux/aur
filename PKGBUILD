# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="bertini"
pkgname="${_pkgname}-bin"
pkgver=1.6
pkgrel=2
pkgdesc="Homotopy continuation solver for systems of polynomial equations"
arch=('x86_64')
url="https://bertini.nd.edu"
license=('custom:Bertini license')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/BertiniLinux64_v${pkgver}.tar.gz")
sha256sums_x86_64=('9ea47e60f21bcc5668eb2909a08b0fac8827c7f48f4ca6f410fa9c2000b4838d')

package() {
  cd "${srcdir}/BertiniLinux64_v${pkgver}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README" "${pkgdir}/usr/share/doc/${_pkgname}/README"
  install -Dm644 "BertiniUsersManual.pdf" "${pkgdir}/usr/share/doc/${_pkgname}/MANUAL.pdf"
  find "examples" -type f -exec install -Dm644 {} "${pkgdir}/usr/share/doc/${_pkgname}/{}" \;

  cd "LICENSES"
  install -Dm644 "Bertini_License"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  # install -Dm644 "GMP_MPFR_License" "${pkgdir}/usr/share/licenses/${_pkgname}/GMP_MPFR_License"
}
