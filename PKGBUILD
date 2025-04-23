# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="slackdump"
pkgname="${_pkgname}-bin"
pkgver=3.1.1
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
b2sums_aarch64=('3b7f61b734c83036c72c1852ad02850fbef7b878142c97a34193c68255f8318add8a383ecb65244bfd730b0d47562f871673711ad9b7431841c140921ad2b0e1')
b2sums_i686=('4f9eea843f44073e4fb1d8d4b6f5e0ba84a7cb79176aca51364495e35111bc8933a01a11f9baed9e8a37e136c462354f07600753af4dcf91f78af3de42fd2a99')
b2sums_x86_64=('372d9cc1a29d414c8c427015e18ce71f04cde1efaac90a5398381dc63e25e32cd04c89336b21835637415ce09ae771926a735112b79f4e0b6e99c4af7d0187aa')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"   "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"     "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"       "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
