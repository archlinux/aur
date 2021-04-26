# Maintainer: David Mehren <david.mehren@udo.edu>

pkgname=element-desktop-nightly-bin
pkgver=2021042601
pkgrel=1
pkgdesc="All-in-one secure chat app for teams, friends and organisations (nightly .deb build)."
arch=('x86_64')
url="https://element.io"
license=('Apache')
depends=('sqlcipher')
source=("https://packages.riot.im/debian/pool/main/e/element-nightly/element-nightly_${pkgver}_amd64.deb"
        "element-desktop-nightly.sh")
sha256sums=('484d7e7d3be8f845499f3b411196453f64c560712ae0a5c6b616c49a310cf4c8'
            'cf5a9348d8ad3f4c7a46bb8abf6ea9059d65231de2cf89f1b5e1885071afb0e2')
replaces=('riot-desktop-nightly-bin')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  install -Dm755 "${srcdir}"/element-desktop-nightly.sh "${pkgdir}"/usr/bin/element-desktop-nightly
}
