# Maintainer: Christoph Brandau <c.brandau91@googlemail.com>

pkgname=gitty-desktop-bin
pkgver=2026.8.10
pkgrel=1
pkgdesc="A lightweight, modern Git client built with Tauri (prebuilt Arch package)"
arch=('x86_64')
url="https://git.cbsk-tech.de/Christoph/GitLite"
license=('MIT')
depends=('git' 'git-lfs' 'webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'librsvg' 'xdotool')
provides=('gitty-desktop')
conflicts=('gitty-desktop')
options=('!strip')

_package="gitty-desktop-2026.8.10-1-x86_64.pkg.tar.zst"
_artifact_url="https://git.cbsk-tech.de/Christoph/GitLite/releases/download/2026.8.10/gitty-desktop-2026.8.10-1-x86_64.pkg.tar.zst"
source=("${_package}::${_artifact_url}")
noextract=("${_package}")
sha256sums=('b882483b5876d98540135b0cec7dce59d89fce6d8834a8dff559288cb5c36544')

package() {
  # Extract only the native package payload, without carrying its package
  # metadata (.PKGINFO, .BUILDINFO and .MTREE) across.
  bsdtar -xf "$srcdir/$_package" -C "$pkgdir" usr
}
