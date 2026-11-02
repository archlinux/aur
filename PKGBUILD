# Maintainer: Zan Skamljic <zan.skamljic@gmail.com>

_pkgname=tde-ariadne
pkgname=tde-ariadne-bin
pkgver=0.3.3
pkgrel=1
pkgdesc='A Nautilus-style file manager built with Qt 6'
arch=(x86_64)
url='https://github.com/zskamljic/tde-ariadne'
license=(GPL-3.0-or-later)
depends=(
  glibc
  libarchive
  libgcc
  libstdc++
  'libtde>=0.3.0'
  qt6-base
  qt6-svg
  wayland
)
optdepends=(
  'udisks2: mounting and ejecting drives, unlocking encrypted ones'
  'exfatprogs: formatting drives as exFAT'
  'dosfstools: formatting drives as FAT'
  'ntfs-3g: formatting drives as NTFS'
  'btrfs-progs: formatting drives as Btrfs'
  'gvfs-mtp: phones and cameras'
  'gvfs-smb: Windows shares (gvfs itself covers SFTP, FTP and WebDAV)'
  'papers: PDF and comic book thumbnails'
  'ffmpegthumbnailer: video thumbnails'
  'bubblewrap: running thumbnailers in a sandbox'
  'librsvg: drawing icons that Qt draws with black patches'
  'qt6-imageformats: thumbnails for WebP, TIFF and other image formats'
  'adwaita-icon-theme: fallback for icons missing from the icon theme'
  'xdg-desktop-portal: picking files for other applications'
)
install=ariadne.install
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
# Built by the release workflow of the sources' repository, from the tag.
source=("$_pkgname-$pkgver-x86_64.tar.zst::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.zst")
noextract=("$_pkgname-$pkgver-x86_64.tar.zst")
sha256sums=('4d29e2bc0fdc1ca7b624bc94666c3cde404a37abe8696bb48e21ce79fa8fdf99')

package() {
  bsdtar -xf "$_pkgname-$pkgver-x86_64.tar.zst" -C "$pkgdir"
}
