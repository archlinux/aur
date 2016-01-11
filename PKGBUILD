# Maintainer=rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# Package name
#pkgbase=
pkgname=actor-messenger-bin

# Version
pkgver=0.1.1
pkgrel=1
#epoch=

# Generic
pkgdesc="Actor Messenger"
arch=('i686' 'x86_64')
url="https://app.actor.im/"
license=('MIT')
#groups=()

# Dependencies
depends=('gconf')
#optdepends=()
#makedepends=('electron')
#checkdepends=()

# Package Relations
#provides=()
#conflicts=()
#replaces=()

# Others
#backup=()
#options=()
#install=modelio
#changelog=changelog

# Sources
source=("actor-messenger.desktop" "icon.png")
source_i686=("https://actor.im/lin32")
source_x86_64=("https://actor.im/lin64")
#noextract=()
#validpgpkeys=()

# Integrity
md5sums=('SKIP' 'SKIP')
md5sums_i686=('49693dbc826039efbafc594b1339ec14')
md5sums_x86_64=('7068a2d64a5c27a0b2d2b5dc928db422')
#sha1sums=()
#sha256sums=()

#pkgver() {
#}

#prepare() {
#}

#build() {
#}

#check() {
#}

package() {
    install -dm755 "$pkgdir/usr/share/applications/"
    install -dm755 "$pkgdir/usr/bin/"
    install -dm755 "$pkgdir/opt/"
    install -Dm755 "$srcdir/actor-messenger.desktop" "$pkgdir/usr/share/applications/"
if [[ "$CARCH" == "i686" ]]; then
    mv "$srcdir/Actor-linux-ia32" "$srcdir/actor-messenger"
elif [[ "$CARCH" == "x86_64" ]]; then
    mv "$srcdir/Actor-linux-x64" "$srcdir/actor-messenger"
fi
    cp -r "$srcdir/actor-messenger" "$pkgdir/opt"
    install -Dm755 "$srcdir/icon.png" "$pkgdir/opt/actor-messenger/"
    ln -s "/opt/actor-messenger/Actor" "${pkgdir}/usr/bin/actor"
}
