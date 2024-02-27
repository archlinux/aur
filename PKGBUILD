# Maintainer: Brуan Childs <godeater[at]𝚐mail[dot]com>
pkgname=vault-ssh-plus-bin
pkgver=0.7.3
pkgrel=3
pkgdesc='An enhanced implementation of vault ssh, wrapping the OpenSSH ssh client to eliminate the management overhead of using of short-lived SSH client keys CA-signed by Hashicorp Vault.'
arch=(x86_64)
url=https://github.com/isometry/vault-ssh-plus
license=('MIT')
depends=('vault')
makedepends=('unzip')
source=("${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_amd64.zip")
noextract=('${pkgname/-bin/}_${pkgver}_linux_amd64.zip')
b2sums=('84c169810bef91ea7b9aadeca04bac590b062ace233e0dde79ef9425bd2041ca764dfeae49dd1287522395e3214e1e15ca7cf63c157d61565dcd406c82ae6ed9')
sha512sums=('d6d0bf45ec0938b65a4874e29655a2359feb678fef0ef1871ce2ca7287276a34135de9e104c80a56008568ff2e9d72f383fcffd62f435fce471551d2950a19a0')

prepare() {
  unzip -d ${srcdir}/${pkgname/-bin/}_${pkgver}_${pkgrel} ${pkgname/-bin/}_${pkgver}_linux_amd64.zip
}

package() {
  _output="${srcdir}/${pkgname/-bin/}_${pkgver}_${pkgrel}"
  install -Dm755 "${_output}/vssh" "${pkgdir}/usr/bin/${pkgname/-bin/}"
  install -Dm644 "${_output}/LICENSE" "${pkgdir}/usr/share/${pkgname/-bin/}/LICENSE"
  install -Dm644 "${_output}/README.md" "${pkgdir}/usr/share/${pkgname/-bin/}/README.md"
}

