# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=lfp-git
_pkgname=lfp
pkgver=2.3
pkgrel=1
pkgdesc='LF-Preview, a wrapper for the lf file manager with image previews, fuzzy-finding and more'
license=('MIT')
arch=('x86_64')
install="lfp.install"
url="https://gitlab.com/a4to/lfp"
depends=(lf zsh ffmpeg ueberzug graphicsmagick ghostscript bat fzf dunst dialog xsel lolcat)
conflicts=(lfp)
optdepends=(
  'git: cloning repos from within lfp'
  )
source=("git+$url.git")
md5sums=('SKIP')

package() {
  cd ${_pkgname}
  install -Dm755 usr/bin/${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 usr/share/${_pkgname}/{lfp,lfpcd,cleaner,scope} -t "${pkgdir}/usr/share/${_pkgname}"
  install -Dm644 usr/share/${_pkgname}/{lfp-icons,lfprc} -t "${pkgdir}/usr/share/${_pkgname}"
  install -Dm644 usr/share/licenses/${_pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 usr/share/doc/${_pkgname}/README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 usr/share/man/man1/${_pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
