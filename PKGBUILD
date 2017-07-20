pkgname=republicanywhere-bin
pkgver=1.1.9
pkgrel=1
pkgdesc="Republic Anywhere desktop client."
arch=('x86_64')
url="republicwireless.com"
license=('EULA')
depends=(libappindicator-gtk2)
source=("http://files.republicwireless.com/public/apps/anywhere/debian/pool/main/r/republicanywhere/republicanywhere_${pkgver}_amd64.deb")
deb="${source[@]##*/}"
noextract=($deb)
sha256sums=('20e7d9cd2ff1d0e9924f1f8d431999e0ab9c86dfa136a327e2355dfe948a2765')

prepare() {
    ar p $deb data.tar.xz | tar xJ
}

package() {
    mv usr $pkgdir/. || return 1
}
