# Maintainer: Brуan Childs <godeater[at]𝚐mail[dot]com>
pkgname=vault-ssh-plus-bin
pkgver=0.6.0
pkgrel=2
pkgdesc='An enhanced implementation of vault ssh, wrapping the OpenSSH ssh client to eliminate the management overhead of using of short-lived SSH client keys CA-signed by Hashicorp Vault.'
arch=(x86_64)
url=https://github.com/isometry/vault-ssh-plus
license=('MIT')
depends=('vault')
makedepends=('unzip')
source=("${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_amd64.zip")
noextract=('${pkgname/-bin/}_${pkgver}_linux_amd64.zip')
b2sums=('1fa45c71e2fcc25dd9cf0a157d5160627455994055bbb4ade721141f1fc701f3c676a8c68d65c438d61d792fa51dcf42c806a9890ffc51e1efe499c0221a6c2e')
sha512sums=('00a03bd3bcf6958f7a21df541f4e18ffc4acb2342b97778e9b93820a5e24abe354b96026caf3bd99c736c3328d373cf425d314b4bae79e88c949d0f76e118547')

prepare() {
  unzip -d ${srcdir}/${pkgname/-bin/}_${pkgver}_${pkgrel} ${pkgname/-bin/}_${pkgver}_linux_amd64.zip
}

package() {
  _output="${srcdir}/${pkgname/-bin/}_${pkgver}_${pkgrel}"
  install -Dm755 "${_output}/vssh" "${pkgdir}/usr/bin/${pkgname/-bin/}"
  install -Dm644 "${_output}/LICENSE" "${pkgdir}/usr/share/${pkgname/-bin/}/LICENSE"
  install -Dm644 "${_output}/README.md" "${pkgdir}/usr/share/${pkgname/-bin/}/README.md"
}

