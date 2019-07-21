# Maintainer: bbbb mxk1 at protonmail dot com
# Contributor: ----

pkgname=btrustbiss
pkgver=2.16
pkgrel=1
pkgdesc="B-Trust browser independent signing service."
arch=('any')
url="https://www.b-trust.org"
license=('GPL')
groups=()
backup=('etc/xdg/autostart/btrust_biss.desktop')
options=('!strip' '!emptydirs')
source=("https://www.b-trust.bg/attachments/BtrustPrivateFile/24/docs/B-TrustBISS.tar")
sha256sums=('b786f7094720f1bfcb0789376775ada6cbcdeaf5ad317450fc79a9e5e054e6e0')
noextract=()
makedepends=()
conflicts=()
replaces=()
backup=()

package(){

     # Extract package
    tar xvf B-TrustBISS.tar "Ubuntu_18.04 v.2.16"
    ar xv "Ubuntu_18.04 v.2.16"/btrustbiss.deb

     # Extract package data
    tar Jxf data.tar.xz -C "$pkgdir"

     # fix for wrong permissions on subdirs:
    find "{$pkgdir}" -type d -exec chmod 755 {} \;

     # install package
   	install -dm644 "$pkgdir" "$pkgdir"/$pkgname
}
