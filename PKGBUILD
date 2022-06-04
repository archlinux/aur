# Maintainer: Juliette Cordor
pkgname="cmd-not-found"
pkgver="1.2.0"
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
  "yay: An aur helper that also prompts user to enter password and fetches regular and aur packages. (if both pamac and yay are installed, pamac is preferred)"
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
sha256sums=('072fa4b69b0bf0c34309660eb7bf451da37c147aa32ce61eaba49e67f7036d5d'
  '4ea211759bb6f865f98c01eb972c8ba3a3040f785736c55d8183e6d12c68e3e9')

noextract=()
validpgpkeys=()

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname.zsh" "$pkgdir/usr/share/zsh/functions/$pkgname.zsh"

  echo "Add the following line to your zshrc:"
  echo "  source /usr/share/zsh/functions/$pkgname.zsh"
}
