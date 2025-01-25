# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="slackdump"
pkgname="${_pkgname}-bin"
pkgver=3.0.4
pkgrel=1
pkgdesc="Save your private and public Slack messages, threads, files, and users locally"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/rusq/${_pkgname}"
license=('GPL-3.0-only')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
b2sums_aarch64=('ea7ba5c3e7cd862362580196fa3b8c8dc176a01da45f605a3a8919cdbf50cae0d2dd2fa70d06f89329d5d31752bb1a15768bee3b6c04866099bf4ab1a927e640')
b2sums_i686=('07fa1cba1939b327d6e2763a1ea18b042276bcf3cfa88e0a1711b92cae76535e2d773340fc3cde9ef42774273a9dd88dac40afb453c5584ddee30ff7734ee027')
b2sums_x86_64=('c344cb4918299e90361e3497cafdf127f6b3c6fe69124dbaedc7cf3065bb446a27c3feb599e60cc1aab668ff9cf0998fbb1f5ec39391084c5e60a48c5be1a9f3')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"   "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"     "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"       "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
