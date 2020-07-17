# Maintainer: koyu <me@koyu.space>
# Based on the PKGBUILD of: David Mehren <david.mehren@udo.edu>

pkgname=element-desktop-bin
pkgver=1.7.1
pkgrel=1
pkgdesc="A glossy Matrix collaboration client for the desktop (stable .deb build)."
arch=('x86_64')
url="https://element.io"
license=('Apache')
source=("https://packages.riot.im/debian/pool/main/e/element-desktop/element-desktop_${pkgver}_amd64.deb"
        "element-desktop.sh")
sha256sums=('6b5fdbed7ec8fc50b9729452b2a022bd6e4e9d85a4318776b1dbe03f1b29ae5f'
            '2e21d346c898122e76605e0c5f1d909596415627bc72e3958aeaa40c523d18a8')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  install -Dm755 "${srcdir}"/element-desktop.sh "${pkgdir}"/usr/bin/element-desktop
}
