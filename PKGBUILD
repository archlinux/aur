# Maintainer: Seth Hendrick <seth@shendrick.net>

# This format is taken from msbuild, which also grabs a compiled .deb and installs it from that.
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=msbuild-stable
# We do this because of https://github.com/mono/mono/issues/9280.  Arch linux's msbuild package
# doesn't include MSBuildSdkResolver and libhostfxr.so.  So, this is the best we can do without
# user having to install all kinds of weird things that are not in the AUR or in pacman.

pkgname=chaskis
pkgver=0.7.0
pkgrel=1
pkgdesc="A generic framework written in C# for making IRC Bots."
arch=('any')
url="https://github.com/xforever1313/Chaskis/"
license=('BSL')
depends=('mono>=5.4.0') # https://docs.microsoft.com/en-us/dotnet/standard/net-standard - .netstandard is implemented in mono 5.4, which is required.
provides=('chaskis')
conflicts=('chaskis')
source=("https://files.shendrick.net/projects/chaskis/releases/$pkgver/linux/debian/chaskis.deb")
sha256sums=('d1f4f939395050089a3d976a4c9b4f5b220ba1a2a3cbc30d3fcc44643bcda265')
validpgpkeys=()

package() {
    cd "${srcdir}"

    bsdtar xf data.tar.xz

    chmod -R g-w usr
    mv usr "${pkgdir}"
}

