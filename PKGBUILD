# Maintainer: Seth Hendrick <seth@shendrick.net>

# This format is taken from msbuild, which also grabs a compiled .deb and installs it from that.
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=msbuild-stable
# We do this because of https://github.com/mono/mono/issues/9280.  Arch linux's msbuild package
# doesn't include MSBuildSdkResolver and libhostfxr.so.  So, this is the best we can do without
# user having to install all kinds of weird things that are not in the AUR or in pacman.

pkgname=chaskis
pkgver=0.30.0
pkgrel=1
pkgdesc="A generic framework written in C# for making IRC Bots."
arch=('any')
url="https://github.com/xforever1313/Chaskis/"
license=('BSL')
depends=('dotnet-runtime>=3.1.0')
provides=('chaskis')
conflicts=('chaskis')
source=("https://files.shendrick.net/projects/chaskis/releases/$pkgver/debian/chaskis.deb")
sha256sums=('47e14daf3f7f0144600489b955469be293358f587270c994c51ad38a39a3ed44')
validpgpkeys=()

package() {
    cd "${srcdir}"

    bsdtar xf data.tar.xz

    chmod -R g-w usr
    mv usr "${pkgdir}"
}

