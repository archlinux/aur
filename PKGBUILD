# Maintainer: Morley93 <mrlz@mrlz.uk>

_pkgname=dns-dodo
pkgname=${_pkgname}-bin
pkgrel=1
pkgver=1.2
pkgdesc="Dynamic DNS sub-domain updater for Digital Ocean."
url="https://github.com/lummie/dns-dodo"
arch=('x86_64')
license=('GPL')
makedepends=()
provides=('dns-dodo')
conflicts=()
replaces=()
backup=()
install=''
source=("https://github.com/lummie/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('1179ae162df1bf174280c4c1ba04dfd1b55154dce7c71772741fd4b1d5dea000')

package() {
  cd "${_pkgname}-v${pkgver}-linux-amd64"

  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m 644 dns-dodo.service "${pkgdir}/usr/lib/systemd/system/dns-dodo.service"
  install -D -m 0755 dns-dodo "${pkgdir}/usr/bin/${_pkgname}"
}
