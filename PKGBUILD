# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=op
pkgver=0.5.6
pkgrel=1
pkgdesc='1Password command-line tool'
arch=('x86_64')
url='https://support.1password.com/command-line/'
license=('agilebits')
source=("https://cache.agilebits.com/dist/1P/op/pkg/v0.5.6-003/op_linux_amd64_v0.5.6-003.zip")
sha256sums=('c59890ed352ecb9b8f90c5ade339ce0738a591e0310b522d028e560aaeed9b89')
checkdepends=('gnupg')

check() {
  gpg --receive-keys 3FEF9748469ADBE15DA7CA80AC2D62742012EA22
  gpg --verify op.sig op
}

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  install -m 0755 op "${pkgdir}/usr/bin/op"
}
