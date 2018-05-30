# Maintainer: Gergely Imreh <imrehg@gmail.com>
pkgname=bluemix-cli
pkgver=0.6.7
pkgrel=1
pkgdesc="Interact with your applications, virtual servers, containers, and other components in IBM Bluemix."
arch=('x86_64' 'i686')
url="http://clis.ng.bluemix.net/ui/home.html"
license=('CUSTOM')
depends=()
source_x86_64=("Bluemix_CLI_${pkgver}_amd64.tar.gz::https://clis.ng.bluemix.net/download/bluemix-cli/${pkgver}/linux64")
source_i686=("Bluemix_CLI_${pkgver}_386.tar.gz::https://clis.ng.bluemix.net/download/bluemix-cli/${pkgver}/linux32")
sha256sums_x86_64=('552fdaf4b82bf62281e10b7fbfb8a31251f7f1b86144648cb87625d406b1fd19')
sha256sums_i686=('74bf687916eef50c7506541dd0765578bbc5a4dab9125ae371e89689e607f81e')

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
