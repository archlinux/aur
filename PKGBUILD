# Mainainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

pkgname=wipemychat-bin
_pkgname=wipemychat
pkgver=1.1.0
pkgrel=1
pkgdesc="Delete all your messages in public and private Telegram chats."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/rusq/wipemychat"
license=('GPL-3.0-or-later')
depends=()
makedepends=()

case "$CARCH" in
  x86_64)
    _arch="x86_64"
    _sha256sum="6e7c2ef29e1cea250dd7f3a2fbc525bd957d5bcf12689501072663f3659031af"
    ;;
  i686)
    _arch="i386"
    _sha256sum="66a46dd7bdd7e241bf2072922cf220babc906095c7760771227f8fba19a2f8c9"
    ;;
  aarch64)
    _arch="arm64"
    _sha256sum="01491cbb04d96cdf1e1f54d3d3bf1dc870d3d65892aa279b14ab044d010e9ede"
    ;;
  *)
    echo "Unsupported architecture"; exit 1 ;;
esac
source=(https://github.com/rusq/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_Linux_${_arch}.tar.gz)
sha256sums=($_sha256sum)

package() {
  cd "$srcdir"
  install -Dm755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${_pkgname}/README.md"
}
