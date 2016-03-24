# Maintainer=rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# actor-messenger-bin
# Contributing: https://gitlab.com/aur-ci/actor-messenger-bin.git
# Builds: https://gitlab.com/aur-ci/actor-messenger-bin/builds
#pkgbase=
pkgname=actor-messenger-bin

# Version
pkgver=0.9.4
pkgrel=1
#epoch=

# Generic
pkgdesc="Actor Messenger"
arch=('i686' 'x86_64')
url="https://actor.im/"
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
#install=actor
changelog=changelog

# Sources
source=("actor-messenger.desktop")
source_i686=("https://dl.bintray.com/actor/apps/Actor-0.9.4-Linux-x86.zip")
source_x86_64=("https://dl.bintray.com/actor/apps/Actor-0.9.4-Linux-x64.zip")
#noextract=()
#validpgpkeys=()

# Integrity
md5sums=('SKIP')
md5sums_i686=('943e210c89a0eb5541a3e226a771c38b')
md5sums_x86_64=('8b08dc3b85ae39e81309fe1fad6108e6')
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
    ln -s "/opt/actor-messenger/Actor" "${pkgdir}/usr/bin/actor"
}
