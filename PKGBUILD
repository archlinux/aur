# Maintainer: bbbb mxk1 at protonmail dot com
# Contributor: ----

pkgname=btrustbiss
pkgver=2.18
pkgrel=1
pkgdesc="B-Trust browser independent signing service."
arch=('any')
url="https://www.b-trust.org"
license=('GPL')
groups=()
backup=('etc/xdg/autostart/btrust_biss.desktop')
options=('!strip' '!emptydirs' '!makeflags')
source=("https://www.b-trust.bg/attachments/BtrustPrivateFile/61/docs/Ubuntu-18-04-v-2-18.tar")
sha256sums=('2d89ff9d9f86e24932f237c9e91fcc560d676befc26e68b96b4ea22b67f91e1e')
noextract=()
makedepends=()
conflicts=()
replaces=()
backup=()

package(){

     # Extract package
    tar xvf Ubuntu-18-04-v-2-18.tar
    ar xv "Ubuntu_18.04 v.2.18/Ubuntu_18.04 v.2.18"/btrustbiss.deb

     # Extract package data
    tar Jxf data.tar.xz -C "$pkgdir"

     # fix for wrong permissions on subdirs:
    find "{$pkgdir}" -type d -exec chmod 755 {} \;

     # install package
   	install -dm644 "$pkgdir" "$pkgdir"/$pkgname
}
