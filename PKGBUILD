# Maintainer: Jasmin <theblazehen@gmail.com>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="slackdump"
pkgname="${_pkgname}-bin"
pkgver=4.3.0
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
    b2sums=('162fe4169381fa2516b4a0405098794ef84fe473189581975aa949ca69243ba8c937d850f11475678c3ee9fa6983e3b8359832d4be1f63ec9f443cd478764481')
    ;;
  i686)
    source=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
    b2sums=('aa9ff0a5a5591cfbdace761efa6582e82a6d349dfa3952ee28be3456154e6eac53a5465b499458a360cd0f046fffab1a6747b20581c63481bc8e481645b73cd6')
    ;;
  x86_64)
    source=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
    b2sums=('710fdfb9ff0b06df7b722c33851e876d7019be58a7a0a490d56977199e137c6c8ab983cbae207735a7b5beb8bdce5e282e5b34a19856d0e07e6a6a6ee97a51f1')
    ;;
esac

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"   "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"     "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"       "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
