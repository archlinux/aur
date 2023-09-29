# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=snip
pkgver=1.1.7
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
  '46dd1f1954d19e039c9ad2c9db3dd7e03087d1ebaf0ff1fab976f943a9bf4fe9b5aef679316db1a7f3116513066b9216bc768440ef2287328898f00fbd7d36a0'
)
md5sums=(
  'a4695aed84f4907bee80a0bd1ebdbc70'
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

  install -Dm755 usr/share/${pkgname}/plugged/${pkgname}/plugin/${pkgname}.vim "${pkgdir}${_vimDir}/plugin/${pkgname}.vim"

}
