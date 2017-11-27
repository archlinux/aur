pkgname=republicanywhere-bin
pkgver=1.5.6
pkgrel=1
pkgdesc="Republic Anywhere desktop client."
arch=('x86_64')
url="republicwireless.com"
license=('EULA')
depends=(libappindicator-gtk2)
source=("http://files.republicwireless.com/public/apps/anywhere/debian/pool/main/r/republicanywhere/republicanywhere_${pkgver}_amd64.deb")
deb="${source[@]##*/}"
noextract=($deb)
sha256sums=('b500d4d40e33cf50029809e04686301f0b82d8453d027a699b184f1cdba408eb')

prepare() {
    ar p $deb data.tar.xz | tar xJ
}

package() {
    mv usr $pkgdir/. || return 1
}
