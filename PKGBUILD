# Maintainer: Gergely Imreh <imrehg@gmail.com>
pkgname=bluemix-cli
pkgver=0.5.6
pkgrel=1
pkgdesc="Interact with your applications, virtual servers, containers, and other components in IBM Bluemix."
arch=('x86_64')
url="http://clis.ng.bluemix.net/ui/home.html"
license=('CUSTOM')
depends=()
source=("http://public.dhe.ibm.com/cloud/bluemix/cli/bluemix-cli/Bluemix_CLI_${pkgver}_amd64.tar.gz")
sha256sums=('5cfcdff370daa306b4db434d0f00cc648fde8fad841f1713e74147263b7e5b53')

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
