# Maintainer: Christoph Brandau <c.brandau91@googlemail.com>

pkgname=gitty-desktop-bin
pkgver=2025.1.1
pkgrel=1
pkgdesc="A lightweight, modern Git client built with Tauri (prebuilt Arch package)"
arch=('x86_64')
url="https://code.cbsk-tech.de/Christoph/Gitty"
license=('MIT')
depends=('git' 'git-lfs' 'webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'librsvg' 'xdotool')
provides=('gitty-desktop')
conflicts=('gitty-desktop')
options=('!strip')

_package="gitty-desktop-2025.1.1-1-x86_64.pkg.tar.zst"
_artifact_url="https://code.cbsk-tech.de/Christoph/Gitty/releases/download/2025.1.1/gitty-desktop-2025.1.1-1-x86_64.pkg.tar.zst"
source=("${_package}::${_artifact_url}")
noextract=("${_package}")
sha256sums=('6d05a043d5dd165525e09adca37f68d6d44f04e32db23530f709c10178198613')

package() {
  # Extract only the native package payload, without carrying its package
  # metadata (.PKGINFO, .BUILDINFO and .MTREE) across.
  bsdtar -xf "$srcdir/$_package" -C "$pkgdir" usr
}
