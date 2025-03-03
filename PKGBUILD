# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="geek-life"
pkgname="${_pkgname}-bin"
pkgver=0.1.2
pkgrel=2
pkgdesc="The CLI To-Do List / Task Manager for Geeks"
arch=('aarch64' 'x86_64')
url="https://github.com/ajaxray/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_linux-arm64")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_linux-amd64")
b2sums=('f35ff2034520b99f26d946ee7c260a4ded0ab9584efcec7c13b6f8856ee5123a0f3838447577fbfcd400ca77d6f2c58aa72711bfe73cdb2204e86ee9cb65a41e'
        '7cf66016dee556264b6c4f5ef6f882a0f3c832a70cd73dce29a671007cf2878ed9d604454400823bfe625f6b70fdca9d88ee8cf20d4327042c7341f5973b220a')
b2sums_aarch64=('974b88e124afc46dea566d2771d83d335480c758de3e22cf981d56e7feff608f258609e6aba3b057ed49a8b912dad67c0d5a0584699e1f6cf0212339b460b22e')
b2sums_x86_64=('b66700c4eccaf20e8ac4d23d7f3232acf8e34248417bf24bf8b2a09650f2a5cd8b9425194c2225530e773642e5a592ee02883e8960e8a2af0813cfe29dafb0b6')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
