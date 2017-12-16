# Maintainer: Gergely Imreh <imrehg@gmail.com>
pkgname=bluemix-cli
pkgver=0.6.3
pkgrel=1
pkgdesc="Interact with your applications, virtual servers, containers, and other components in IBM Bluemix."
arch=('x86_64' 'i686')
url="http://clis.ng.bluemix.net/ui/home.html"
license=('CUSTOM')
depends=()
source_x86_64=("Bluemix_CLI_${pkgver}_amd64.tar.gz::https://clis.ng.bluemix.net/download/bluemix-cli/${pkgver}/linux64")
source_i686=("Bluemix_CLI_${pkgver}_386.tar.gz::https://clis.ng.bluemix.net/download/bluemix-cli/${pkgver}/linux32")
sha256sums_x86_64=('8112b1b7e7d60c7147e13e83d8b1a99f15c415bc2e720b27b1167d66d6b7031a')
sha256sums_i686=('24890059f31023910a47be88c78e7cdb122053a18a5c7bbeabe6628cc953dfc2')

package() {
  cd "${srcdir}/Bluemix_CLI/"

  install -Dm755 "bin/bluemix" "${pkgdir}/opt/Bluemix/bin/bluemix"
  install -Dm755 "bin/bluemix-analytics" "${pkgdir}/opt/Bluemix/bin/bluemix-analytics"
  install -Dm755 "bin/cfcli/cf" "${pkgdir}/opt/Bluemix/bin/cfcli/cf"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/Bluemix/bin/bluemix" "${pkgdir}/opt/Bluemix/bin/bx"
  ln -s "/opt/Bluemix/bin/bluemix" "${pkgdir}/usr/bin/bluemix"
  ln -s "/opt/Bluemix/bin/bluemix" "${pkgdir}/usr/bin/bx"
  ln -s "/opt/Bluemix/bin/bluemix-analytics" "${pkgdir}/usr/bin/bluemix-analytics"
  install -Dm644 "bin/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
