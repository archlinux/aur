# Maintainer: Nova <eecglobal.dev@gmail.com>

pkgname=explorenova-bin
_pkgname=explorenova
pkgver=0.1.0
pkgrel=1
pkgdesc='Terminal file manager: git-annotated tree, previews, fuzzy search, vim keys (prebuilt)'
arch=('x86_64')
url='https://github.com/Novaturiente/explorenova'
license=('GPL-3.0-or-later')
depends=(
  'gcc-libs' 'glibc'
  'libgit2.so=1.9-64' 'libonig.so=5-64'
  # Archive extraction (Enter on .tar/.zip/.gz/.bz2/.xz/.zst).
  'tar' 'gzip' 'bzip2' 'xz' 'zstd' 'unzip'
)
optdepends=(
  '7zip: extract .7z archives'
  'poppler: PDF preview (pdftoppm)'
  'libavif: AVIF image preview (avifdec)'
  'ffmpegthumbnailer: video thumbnail preview'
  'udiskie: devices modal mount/unmount/list'
  'gvfs-smb: SMB network shares (gio mount)'
  'unrar: extract .rar archives'
  'wl-clipboard: copy paths under Wayland (wl-copy)'
  'xclip: copy paths under X11'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-linux.tar.gz")
sha256sums=('81d55b3cae55943cab594b8dcb636ded59ef6386ade7a9127e1f528cf29dc5c5')

package() {
  cd "$_pkgname-$pkgver-x86_64-linux"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
