# Maintainer: Jasmin <theblazehen@gmail.com>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="slackdump"
pkgname="${_pkgname}-bin"
pkgver=3.1.13
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
b2sums_aarch64=('86b3ee4aa31f2c1b3b8f35030964158b4ac67e10e21a52e2bfa9cda469ca6541cc2b46b2a2de72d4f465823fb60d4da4aeb2fd6b44bccf52d20e4ac3aa693ef5')
b2sums_i686=('f2bca514dc75407d043a5f832fcca9bac6b040021c9fccf2425f9987a99e309cd30f8532aed0ad7a3be846c7f003773f27381eb8ee26638a5c1072d9349a6046')
b2sums_x86_64=('be71f49ca2aab82884786c5af775a6cf1b44bf544f74b94e38e7ab1a2f687153075a353a11f91c10f614cadcb7ff3e258c26ea1d6d693aa3f9453c70cce2dc57')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"   "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"     "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"       "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
