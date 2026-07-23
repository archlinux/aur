#Maintainer: Toni Sagrista Selles <tsagrista@ari.uni-heidelberg.de>
pkgname=gaiasky
pkgver=3.8.0
pkgrel=1
epoch=3
_versionstr=3.8.0.aa0f9c68c
_srcname="$pkgname-${_versionstr//_/-}"
pkgdesc="Open source 3D universe simulator for desktop and VR with support for more than a billion objects"
arch=(x86_64)
url="https://gaiasky.space"
license=('MPL')
depends=('java-runtime>=26' 'xorg-xrandr')
changelog=releasenotes.txt
source=("https://gaia.ari.uni-heidelberg.de/gaiasky/files/releases/${_versionstr//_/-}/$pkgname-${_versionstr//_/-}.tar.gz")
noextract=()
sha256sums=("057c50b387c8df186f2fff8cac7aedae1358bbd509daf99a7c1a5278e5bbe859")
validpgpkeys=()

prepare() {
	cd "$srcdir/$_srcname"
}

build() {
:
}

check() {
:
}

package() {
    cd "$srcdir/$_srcname"

    # Install the main application files
    install -d "$pkgdir/opt/gaiasky/"
    cp -dr --no-preserve=ownership . "$pkgdir/opt/gaiasky/"

    # Create the symlink in /usr/bin
    install -d "$pkgdir/usr/bin/"
    ln -s /opt/gaiasky/gaiasky "$pkgdir/usr/bin/gaiasky"

    # Install the desktop file
    install -Dm644 "gaiasky.desktop" "$pkgdir/usr/share/applications/gaiasky.desktop"

    # Install the man page
    install -Dm644 "gaiasky.6.gz" "$pkgdir/usr/share/man/man6/gaiasky.6.gz"
}

