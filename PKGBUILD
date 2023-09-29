# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=snip
pkgver=1.2.0
pkgrel=1
pkgdesc="A simple snippet manager for your predefined Ultisnips Snippet Directory"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(neovim)
source=(
  "https://software.concise.cc/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.xz"
)
sha512sums=(
  '97db421c99b0fd707444d784a97f757d6d70ea3a5862ad0b77aa27d7bb9d2325b1c643ca3b8473a08b5eb8107f10fe53d81922b0b1f1e721510d3c0ee0d20955'
)
md5sums=(
  '5fb143d40d9dcd624374ebd7ba5ea615'
)
validpgpkeys=(
  '81BACEEBC3EA26E127166E4A819BB92A9A48160E'
)

package() {

  cd "$srcdir/${pkgname}-${pkgver}-${pkgrel}-${arch}" ||
  cd "$srcdir/${pkgname}"

  [ -d ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged ] && _vimDir=${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged || _vimDir=$HOME/.vim/plugged;

  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 usr/share/doc/${pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm755 usr/share/man/man1/${pkgname}.1.gz "${pkgdir}usr/share/man/man1/${pkgname}.1.gz"
  install -Dm755 usr/share/${pkgname}/plugin/${pkgname}.vim "${pkgdir}/usr/share/${pkgname}/plugin/${pkgname}.vim"
  install -Dm644 usr/share/${pkgname}/plugin/${pkgname}.vim "${pkgdir}${_vimDir}/${pkgname}/plugin/${pkgname}.vim"

}
