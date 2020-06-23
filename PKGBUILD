# Maintainer: David Mehren <david.mehren@udo.edu>

pkgname=riot-desktop-nightly-bin
pkgver=2020062301
pkgrel=1
pkgdesc="A glossy Matrix collaboration client for the desktop (nightly .deb build)."
arch=('x86_64')
url="https://riot.im"
license=('Apache')
source=("https://packages.riot.im/debian/pool/main/r/riot-nightly/riot-nightly_${pkgver}_amd64.deb"
        "riot-desktop-nightly.sh")
sha256sums=('8c74315575a46eee03d4d0cc8b1043c23f85432ec6ecd54f8fd8f56d80b095a4'
            'f6c01c7b4ed8f200d89a3a8e8ff10db7b4d5043ad1a77fb75c51440c236f0678')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  install -Dm755 "${srcdir}"/riot-desktop-nightly.sh "${pkgdir}"/usr/bin/riot-desktop-nightly
}
