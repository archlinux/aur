# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=snip
pkgver=1.1.8
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
  'ffd0c51b3e9f6b9162676a17853ebad345432394ca8bfd778a0139876a9f7999f7e27ec8c1377cc3639662ffa551f6a29c13b4ba770a69261f86f8273164e3e8'
)
md5sums=(
  '99075dac671f0a7ace0edd6a75ea1302'
)
validpgpkeys=(
  '81BACEEBC3EA26E127166E4A819BB92A9A48160E'
)

package() {

  cd "$srcdir/${pkgname}-${pkgver}-${pkgrel}-${arch}" ||
  cd "$srcdir/${pkgname}"

  [ -d ${XDG_CONFIG_HOME:-$HOME/.config}/nvim ] && _vimDir=${XDG_CONFIG_HOME:-$HOME/.config}/nvim || _vimDir=$HOME/.vim;

  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 usr/share/doc/${pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm755 usr/share/man/man1/${pkgname}.1.gz "${pkgdir}usr/share/man/man1/${pkgname}.1.gz"
  install -Dm755 usr/share/${pkgname}/plugged/${pkgname}/plugin/${pkgname}.vim "${pkgdir}/usr/share/${pkgname}/plugin/${pkgname}.vim"

  install -Dm755 usr/share/${pkgname}/plugged/${pkgname}/plugin/${pkgname}.vim "${pkgdir}${_vimDir}/plugged/${pkgname}/plugin/${pkgname}.vim"

}
