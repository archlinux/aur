pkgname=republicanywhere-bin
pkgver=1.2.12
pkgrel=1
pkgdesc="Republic Anywhere desktop client."
arch=('x86_64')
url="republicwireless.com"
license=('EULA')
depends=(libappindicator-gtk2)
source=("http://files.republicwireless.com/public/apps/anywhere/debian/pool/main/r/republicanywhere/republicanywhere_${pkgver}_amd64.deb")
deb="${source[@]##*/}"
noextract=($deb)
sha256sums=('20c773c152823bb2d0d7c8c06277a4ddab065cfc13bb48b99e46c179a0dd5c12')

prepare() {
    ar p $deb data.tar.xz | tar xJ
}

package() {
    mv usr $pkgdir/. || return 1
}
