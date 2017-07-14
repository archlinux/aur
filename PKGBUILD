pkgname=republicanywhere-bin
pkgver=1.1.8
pkgrel=1
pkgdesc="Republic Anywhere desktop client."
arch=('x86_64')
url="republicwireless.com"
license=('EULA')
depends=(libappindicator-gtk2)
source=("http://files.republicwireless.com/public/apps/anywhere/debian/pool/main/r/republicanywhere/republicanywhere_${pkgver}_amd64.deb")
deb="${source[@]##*/}"
noextract=($deb)
sha256sums=('d57474f318521a174cc8236e4361de0fa4564ea29b167f37ec3d1ce219b1d481')

prepare() {
    ar p $deb data.tar.xz | tar xJ
}

package() {
    mv usr $pkgdir/. || return 1
}
