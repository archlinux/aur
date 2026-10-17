# Maintainer: Lucasion <ion@ionnet.dev>
# Installs the pacman package attached to tuicode's GitHub release.
pkgname=tuicode-bin
_pkgname=tuicode
pkgver=0.2.0
pkgrel=1
pkgdesc="A Visual Studio Code style code editor for the terminal, with LSP, git, debugging and an integrated terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/LucasionGS/tuicode"
license=('MIT')
depends=('glibc')
optdepends=(
  'git: source control'
  'ripgrep: faster find in files'
  'wl-clipboard: clipboard on Wayland'
  'xclip: clipboard on X11'
  'delve: debugging Go'
  'gdb: debugging C, C++ and Rust'
  'gopls: Go language server'
  'typescript-language-server: TypeScript and JavaScript language server'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!debug' '!strip')
source_x86_64=("$_pkgname-$pkgver-x86_64.pkg.tar.zst::$url/releases/download/v$pkgver/$_pkgname-$pkgver-1-x86_64.pkg.tar.zst")
source_aarch64=("$_pkgname-$pkgver-aarch64.pkg.tar.zst::$url/releases/download/v$pkgver/$_pkgname-$pkgver-1-aarch64.pkg.tar.zst")
sha256sums_x86_64=('e892b1aec24e3a2441581d4f18f933a0c30023c739f87b61fe57fe009678e8b4')
sha256sums_aarch64=('777e9636a138fe0b43e66704d923930f478da415361fb574039788e98903a3ab')

package() {
  # makepkg extracted the release package into $srcdir; take its files, not its pacman metadata
  cp -a "$srcdir/usr" "$pkgdir/"
}
