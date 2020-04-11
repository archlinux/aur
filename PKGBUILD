# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=orchestrator-bin
pkgver=3.1.4
pkgrel=1
pkgdesc='MySQL high availability and replication management tool, runs as a service and provides command line access, HTTP API and Web interface'
arch=('i686' 'x86_64')
url='https://github.com/openark/orchestrator'
license=('Apache-2.0')
options=('!emptydirs')
source=("https://github.com/openark/orchestrator/releases/download/v${pkgver}/orchestrator-${pkgver}-linux-amd64.tar.gz")
noextract=("orchestrator-${pkgver}-linux-amd64.tar.gz")
md5sums=('9ba2127366c91f60c34bd169f524a4e0')

package() {
  tar xf "${srcdir}"/*.tar.gz -C "${pkgdir}"
  mkdir -p "${pkgdir}/opt"
  mkdir -p "${pkgdir}/usr/bin"
  mv "${pkgdir}/usr/local/orchestrator" "${pkgdir}/opt/"
  ln -s /opt/orchestrator/orchestrator "${pkgdir}/usr/bin/orchestrator"
}
# vim:set ts=2 sw=2 et: