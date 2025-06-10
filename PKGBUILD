# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="slackdump"
pkgname="${_pkgname}-bin"
pkgver=3.1.4
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
b2sums_aarch64=('e8aaae1a373b18c3f74bdd3d1aca7a89a4341b27492355fc9df6b25f9aadbd2e5c4fd1e2b434ed1d8700e5e8ee48fa9c1d8b7f15d956918627c9c3e34da540fa')
b2sums_i686=('9974f5a3afe099a55bca790b6a33c915ab497f3217f8a8e6336c11979afdaa1aee70ae4ded9f042ececd9b4ffd768004e37fba5011c314d1e291c6e287c7b973')
b2sums_x86_64=('48c73469c3e1504c51f69eb5ce0488534b19dbc1bd8b2c101b6c8083cc05d37617c5b8e37c64c8330bea5b7c29c750529532f07b599029e130170033a0eb70b3')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"   "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"     "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"       "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
