#Maintainer: Toni Sagrista Selles <tsagrista@ari.uni-heidelberg.de>
pkgname=gaiasky
pkgver=3.9.2
pkgrel=1
epoch=3
_versionstr=3.9.2.95a9305a9
_srcname="$pkgname-${_versionstr//_/-}"
pkgdesc="Open source 3D universe simulator for desktop and VR with support for more than a billion objects"
arch=(x86_64)
url="https://gaiasky.space"
license=('MPL')
depends=('java-runtime>=26' 'xorg-xrandr')
changelog=releasenotes.txt
source=("https://gaia.ari.uni-heidelberg.de/gaiasky/files/releases/${_versionstr//_/-}/$pkgname-${_versionstr//_/-}.tar.gz")
noextract=()
sha256sums=("7059f2214eb500c3e49b8b02b19b534d3975aaa96baaa460b698fcd7f9332cf6")
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

