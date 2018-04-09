# Maintainer: Gergely Imreh <imrehg@gmail.com>
pkgname=bluemix-cli
pkgver=0.6.6
pkgrel=1
pkgdesc="Interact with your applications, virtual servers, containers, and other components in IBM Bluemix."
arch=('x86_64' 'i686')
url="http://clis.ng.bluemix.net/ui/home.html"
license=('CUSTOM')
depends=()
source_x86_64=("Bluemix_CLI_${pkgver}_amd64.tar.gz::https://clis.ng.bluemix.net/download/bluemix-cli/${pkgver}/linux64")
source_i686=("Bluemix_CLI_${pkgver}_386.tar.gz::https://clis.ng.bluemix.net/download/bluemix-cli/${pkgver}/linux32")
sha256sums_x86_64=('05f9c1c06a612eb774a7a3dc2a2e56d4f70583b26431f938a0197f4d185792eb')
sha256sums_i686=('2e895962179d6bb777f4e603df1745b884329d60155d4c10935b815a3f720c7d')

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
