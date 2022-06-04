# Maintainer: Juliette Cordor
pkgname="cmd-not-found"
pkgver="1.1.0"
pkgrel="2"
pkgdesc="A simple hook to display required packages when a command is not found"
url="https://github.com/jewlexx/cmd-not-found"
arch=("any")
license=("MIT")
groups=()
depends=("pkgfile" "zsh")
makedepends=("tar")
checkdepends=()
optdepends=(
  "pamac-cli: Prompts user to enter password and fetches regular, aur, flatpak, snap, etc. packages"
  "yay: An aur helper that also prompts user to enter password and fetches regular and aur packages. (if both are installed, pamac is preferred)"
)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
  "$pkgname-$pkgver.tar.gz::https://codeload.github.com/jewlexx/$pkgname/tar.gz/refs/tags/v$pkgver"
  "uninstall.sh"
)
sha256sums=('2045ba998c499be78e270b9fec3d6bc12d1cb1f5a139cce66bdeac090f085a1f'
  '4ea211759bb6f865f98c01eb972c8ba3a3040f785736c55d8183e6d12c68e3e9')

noextract=()
validpgpkeys=()

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname.zsh" "$pkgdir/usr/share/zsh/functions/$pkgname.zsh"

  echo "Add the following line to your zshrc:"
  echo "  source /usr/share/zsh/functions/$pkgname.zsh"
}
