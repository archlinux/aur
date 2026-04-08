#Maintainer: Toni Sagrista Selles <tsagrista@ari.uni-heidelberg.de>
pkgname=gaiasky
pkgver=3.7.2
pkgrel=1
epoch=3
_versionstr=3.7.2.d859c5d9e
_srcname="$pkgname-${_versionstr//_/-}"
pkgdesc="Open source 3D universe simulator for desktop and VR with support for more than a billion objects"
arch=(x86_64)
url="https://gaiasky.space"
license=('MPL')
depends=('java-runtime>=25' 'xorg-xrandr')
changelog=releasenotes.txt
source=("https://gaia.ari.uni-heidelberg.de/gaiasky/files/releases/${_versionstr//_/-}/$pkgname-${_versionstr//_/-}.tar.gz")
noextract=()
sha256sums=("4aad3b1144baeca236d7f422e06c9ad78825de6c3071faffc03905bbbcf93453")
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

