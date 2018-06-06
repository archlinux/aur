pkgname=republicanywhere-bin
pkgver=1.5.9
pkgrel=1
pkgdesc="Republic Anywhere desktop client."
arch=('x86_64')
url="republicwireless.com"
license=('EULA')
depends=(libappindicator-gtk2)
source=("http://files.republicwireless.com/public/apps/anywhere/debian/pool/main/r/republicanywhere/republicanywhere_${pkgver}_amd64.deb")
deb="${source[@]##*/}"
noextract=($deb)
sha256sums=('1f9e94da22e619357cba7d4513b1ff5cdb7179d930bc26eb28b8c47fab6667d3')

prepare() {
    ar p $deb data.tar.xz | tar xJ
}

package() {
    mv usr $pkgdir/. || return 1
}
