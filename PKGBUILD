# Maintainer: Seth Hendrick <seth@shendrick.net>

# This format is taken from msbuild, which also grabs a compiled .deb and installs it from that.
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=msbuild-stable
# We do this because of https://github.com/mono/mono/issues/9280.  Arch linux's msbuild package
# doesn't include MSBuildSdkResolver and libhostfxr.so.  So, this is the best we can do without
# user having to install all kinds of weird things that are not in the AUR or in pacman.

pkgname=chaskis
pkgver=0.20.0
pkgrel=1
pkgdesc="A generic framework written in C# for making IRC Bots."
arch=('any')
url="https://github.com/xforever1313/Chaskis/"
license=('BSL')
depends=('dotnet-runtime>=3.1.0')
provides=('chaskis')
conflicts=('chaskis')
source=("https://files.shendrick.net/projects/chaskis/releases/$pkgver/debian/chaskis.deb")
sha256sums=('043e8e9449c665c6790d20c8a5f3e4d25c9ff518bc8645389a9429e95614eb2f')
validpgpkeys=()

package() {
    cd "${srcdir}"

    bsdtar xf data.tar.xz

    chmod -R g-w usr
    mv usr "${pkgdir}"
}

