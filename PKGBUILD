# Maintainer: Brуan Childs <godeater[at]𝚐mail[dot]com>
pkgname=vault-ssh-plus-bin
pkgver=0.8.0
pkgrel=1
pkgdesc='An enhanced implementation of vault ssh, wrapping the OpenSSH ssh client to eliminate the management overhead of using of short-lived SSH client keys CA-signed by Hashicorp Vault.'
arch=(x86_64)
url=https://github.com/isometry/vault-ssh-plus
license=('MIT')
depends=('vault')
makedepends=('unzip')
source=("${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_amd64.zip")
noextract=('${pkgname/-bin/}_${pkgver}_linux_amd64.zip')
b2sums=('9e1acb69910750f2194f7bbd9b939826175b1d9e61a42ea443166a28f29af60ea608c7ef76d8715222ba911672934778c713b087bc0d2d66837b4d4e881afd25')
sha512sums=('35ee75bef3340586e42984c898b50dc42727a8d6de8805b55551b258426ec460f10837055de118fdb46dedaaab34f7de9a97989aeb87fa506fadf14192f56722')

prepare() {
  unzip -d ${srcdir}/${pkgname/-bin/}_${pkgver}_${pkgrel} ${pkgname/-bin/}_${pkgver}_linux_amd64.zip
}

package() {
  _output="${srcdir}/${pkgname/-bin/}_${pkgver}_${pkgrel}"
  install -Dm755 "${_output}/vssh" "${pkgdir}/usr/bin/${pkgname/-bin/}"
  install -Dm644 "${_output}/LICENSE" "${pkgdir}/usr/share/${pkgname/-bin/}/LICENSE"
  install -Dm644 "${_output}/README.md" "${pkgdir}/usr/share/${pkgname/-bin/}/README.md"
}

