# Maintainer: David Mehren <david.mehren@udo.edu>

pkgname=element-desktop-nightly-bin
pkgver=2021121501
pkgrel=1
pkgdesc="All-in-one secure chat app for teams, friends and organisations (nightly .deb build)."
arch=('x86_64')
url="https://element.io"
license=('Apache')
depends=('sqlcipher')
source=("https://packages.riot.im/debian/pool/main/e/element-nightly/element-nightly_${pkgver}_amd64.deb"
        "element-desktop-nightly.sh")
sha256sums=('ccee4b2e5ca08717f973d2d9b4049731f647b801a71f65ce14c641c3a1f6c70b'
            'eec30e5b0e549f7fa9c9c66fd3edb60bc8e0d9d0a77b79d8659cc06deced588d')
replaces=('riot-desktop-nightly-bin')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  install -Dm755 "${srcdir}"/element-desktop-nightly.sh "${pkgdir}"/usr/bin/element-desktop-nightly
}
