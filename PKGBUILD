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
  'ac8a7a4172f6172a1aaed210cbd44e8dd2aaf234e283511e530203e3ddf34a891fcfeee53ba08517a238130713b0f5981111bb572d01dd3192f74a367409055d'
)
md5sums=(
  'c2d41dfa8deec2437258d7c26e165d79'
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
