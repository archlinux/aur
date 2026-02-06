# Maintainer: Alberto Bonizzi <aseoista at gmail dot com>

pkgname=nuxmv-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="State of the art, infinite state model checker built on NuSMV"
arch=('x86_64')
url="https://nuxmv.fbk.eu/"
license=('LicenseRef-nuXmv-FBK-License')
provides=('nuXmv')

optdepends=('python')

source_x86_64=("nuXmv-${pkgver}-linux64.tar.xz::https://nuxmv.fbk.eu/theme/download.php?file=nuXmv-${pkgver}-linux64.tar.xz")

sha256sums_x86_64=('c7dfec43749bcb230c857efe81099b95d868b94efd9f81bccebe542a306a7c83')

package() {
  _output="${srcdir}/nuXmv-${pkgver}-linux64"
  install -Dm755 "${_output}/bin/nuXmv" "${pkgdir}/usr/bin/nuXmv"
  install -Dm644 "${_output}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 "${_output}/doc/user-man/nuxmv.pdf" -t "${pkgdir}/usr/share/doc/nuXmv/"
  cp -r "${_output}/share/nuxmv/"  "${pkgdir}/usr/share/nuXmv/"
  cp -r "${_output}/examples/"  "${pkgdir}/usr/share/nuXmv/examples"
}
