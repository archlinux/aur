# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=go-ipfs-bin
pkgver=0.3.7
pkgrel=1
pkgdesc="Zero knowledge cloud-based password manager"
url="https://ipfs.io"
arch=('x86_64' 'i686')
provides=('ipfs')
license=('MIT')

source_i686=("https://gobuilder.me/get/github.com/ipfs/go-ipfs/cmd/ipfs/ipfs_v${pkgver}_linux-386.zip")
sha256sums_i686=('7bf5e9473117c5e1ad36aafb8781ab66f58a06b15c5cbc9e961e2e47e987cc86')

source_x86_64=("https://gobuilder.me/get/github.com/ipfs/go-ipfs/cmd/ipfs/ipfs_v${pkgver}_linux-amd64.zip")
sha256sums_x86_64=('097d8bec12cfd4df6d173e3bf4aaede3ad5d3167f7f23bba3238be48e82e84e6')

noextract=("ipfs_v${pkgver}_linux-amd64.zip")

prepare() {
  unzip -q ipfs_v${pkgver}_linux-amd64.zip
}

package() {
  install -Dm755 "${srcdir}/ipfs/ipfs" "${pkgdir}/usr/bin/ipfs"
}

# vim:set ts=2 sw=2 et:
