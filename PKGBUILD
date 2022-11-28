# Maintainer: EndlessEden <eden@deep-rose.org>
# Previous Maintainer: redfish <redfish@galactica.pw>
# Contributor: Gergely Imreh <imrehg@gmailcom>
# Contributor: Jakub "Kubuxu" Sztandera  <kubuxu@protonmail.ch>
# vim: set expandtab ts=2 sw=2:

pkgname=ipget
pkgver=0.9.1
pkgrel=1
pkgdesc="wget for IPFS: retrieve files over IPFS and save them locally. Binary Version (Requires working go-ipfs)"
arch=('x86_64')
url="https://github.com/ipfs/ipget"
license=('MIT')
makedepends=('go' 'gx' 'gx-go' 'go-ipfs')
depends=('go' 'gx' 'gx-go' 'go-ipfs')
source=("http://dist.ipfs.tech.ipns.localhost:8080/ipget/v"${pkgver}"/ipget_v"${pkgver}"_linux-amd64.tar.gz")
sha256sums=('f708fa74af94846460bbdb472dab2393211475bd6a3106ef25772a3275636ffe')

prepare() {
  chmod a+x "${srcdir}/${pkgname}/ipget"
}

package() {
  install -D "${srcdir}/${pkgname}/ipget" "${pkgdir}/usr/bin/ipget"
}

