# Maintainer: Christoph Brandau <c.brandau91@googlemail.com>

pkgname=gitty-desktop-bin
pkgver=2026.9.10
pkgrel=1
pkgdesc="A lightweight, modern Git client built with Tauri (prebuilt Arch package)"
arch=('x86_64')
url="https://code.cbsk-tech.de/Christoph/Gitty"
license=('MIT')
depends=('git' 'git-lfs' 'webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'librsvg' 'xdotool')
provides=('gitty-desktop')
conflicts=('gitty-desktop')
options=('!strip')

_package="gitty-desktop-2026.9.10-1-x86_64.pkg.tar.zst"
_artifact_url="https://code.cbsk-tech.de/Christoph/Gitty/releases/download/2026.9.10/gitty-desktop-2026.9.10-1-x86_64.pkg.tar.zst"
source=("${_package}::${_artifact_url}")
noextract=("${_package}")
sha256sums=('a8f7efa79f78339aaa2b204a15720a34e10af5e8017c7a88c685b7437f392677')

package() {
  # Extract only the native package payload, without carrying its package
  # metadata (.PKGINFO, .BUILDINFO and .MTREE) across.
  bsdtar -xf "$srcdir/$_package" -C "$pkgdir" usr
}
