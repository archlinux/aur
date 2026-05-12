# Maintainer: Rodolfo Altenrath <rodolfoaltenrath@users.noreply.github.com>

pkgname=elo-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Conecta Linux ao PJe/Projudi com Java 8 isolado e certificados digitais'
arch=('x86_64')
url='https://github.com/rodolfoaltenrath/elo'
license=('custom')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'nss'
  'pcsclite'
  'polkit'
)
optdepends=(
  'jre8-openjdk: execução de assinadores Java legados'
  'icedtea-web: abertura de arquivos .jnlp'
  'ccid: suporte a leitores smartcard CCID'
  'opensc: diagnóstico e leitura de certificados'
  'pcsc-tools: ferramentas de diagnóstico PC/SC'
)
provides=('elo')
conflicts=('elo')
source=(
  "elo-v${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/elo-v${pkgver}-linux-amd64.tar.gz"
  "elo.desktop::${url}/raw/main/packaging/arch/elo.desktop"
  "elo.png::${url}/raw/main/build/appicon.png"
)
sha256sums=(
  '62450d6987d57db95890da34ea0555b39b2c582508f634b3b76d7a3a47f434b7'
  'SKIP'
  'SKIP'
)

package() {
  install -Dm755 elo "${pkgdir}/usr/bin/elo"
  install -Dm644 elo.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/elo.png"
  install -Dm644 elo.desktop "${pkgdir}/usr/share/applications/elo.desktop"
}
