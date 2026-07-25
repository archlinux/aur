# Maintainer: Jasmin <theblazehen@gmail.com>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="slackdump"
pkgname="${_pkgname}-bin"
pkgver=4.4.2
pkgrel=1
pkgdesc="Save your private and public Slack messages, threads, files, and users locally"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/rusq/${_pkgname}"
license=('GPL-3.0-only')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
case "$CARCH" in
  aarch64)
    source=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
    sha256sums=('71d8b55b9132c0d39d6fe66e3542ee7d2ec6c032b7701928124c736611cc235e')
    ;;
  i686)
    source=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
    sha256sums=('30506c86fbed1901d22486a4b267d9cfbc0042b33b5368cea0fa79d1bb3ba1d9')
    ;;
  x86_64)
    source=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
    sha256sums=('e2f386b2af30b0ba0ae98973f6a053225fba7d7127a20ad196cfdd96bf601052')
    ;;
esac

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"   "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"     "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"       "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
