# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=op
pkgver=0.5.5
pkgrel=1
pkgdesc='1Password command-line tool'
arch=('x86_64')
url='https://support.1password.com/command-line/'
license=('agilebits')
source=("https://cache.agilebits.com/dist/1P/op/pkg/v$pkgver/op_linux_amd64_v$pkgver.zip")
sha256sums=('143ef5ba96202137e22b06b781ef2617b1cb4b865c4752c5924f806222f71e05')
checkdepends=('gnupg')

check() {
  gpg --receive-keys 3FEF9748469ADBE15DA7CA80AC2D62742012EA22
  gpg --verify op.sig op
}

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  install -m 0755 op "${pkgdir}/usr/bin/op"
}
