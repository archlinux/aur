# Maintainer: Marcus B Spencer <marcus at marcusspencer dot us>

_pkgname=acme-dns-client
pkgname=${_pkgname}-bin
pkgver=0.3
pkgrel=1
pkgdesc="A client software for https://github.com/joohoi/acme-dns"
arch=('x86_64')
url="https://github.com/acme-dns/${_pkgname}"
license=('MIT')
optdepends=('certbot: DNS-01 challenge integration')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('f7b1892ee9ce2eb22d9d3b5bd8d03d01e2660661d7d461da512f60cca64ae3ef')

package() {
  install -Dm755 ${_pkgname} "${pkgdir}"/usr/bin/${_pkgname}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
