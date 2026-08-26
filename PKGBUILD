# Maintainer: EndlessEden < endlesseden [at] deep-rose {dot} org >
# vim: set expandtab ts=2 sw=2:

pkgname=ipget-bin
_pkgname=ipget
pkgver=0.13.2
pkgrel=1
pkgdesc="wget for IPFS: retrieve files over IPFS and save them locally. Binary Version (Requires working go-ipfs)"
arch=('x86_64')
url="https://github.com/ipfs/ipget"
license=('MIT')
makedepends=('go' 'gx' 'gx-go' 'go-ipfs')
depends=('go' 'gx' 'gx-go' 'go-ipfs')
provies=('ipget')
conflicts=('ipget')
source=("http://dist.ipfs.tech.ipns.localhost:8080/ipget/v"${pkgver}"/ipget_v"${pkgver}"_linux-amd64.tar.gz")
sha256sums=('f14661caccc4d877ce81d5e06febcb8bd4f87386673b0f4afe493d0ff894c4f5')

prepare() {
  chmod a+x "${srcdir}/${_pkgname}/ipget"
}

package() {
  install -D "${srcdir}/${_pkgname}/ipget" "${pkgdir}/usr/bin/ipget"
}

