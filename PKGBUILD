# Maintainer: SLIGHTLKE <SLIGHTLKE@outlook.com>
pkgname=otf-nerd-fonts
pkgver=3.4.0
pkgrel=1
pkgdesc="Nerd Fonts is a project that patches developer targeted fonts with a high number of glyphs ; This is only otf"
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT' 'OFL')
provides=('ttf-font-nerd')
makedepends=('git')

source=("nerd-fonts::git+https://github.com/ryanoasis/nerd-fonts.git#depth=1")
sha256sums=('SKIP')

package() {
  otfdir="${pkgdir}/usr/share/fonts/${pkgname}"
  install -dm755 "$otfdir"

 find "$srcdir/nerd-fonts/patched-fonts" \
    -type f -iname '*.otf' \
    ! -iname '*Windows*' \
    -exec install -m644 {} "$otfdir/" \;

  install -Dm644 "${srcdir}/nerd-fonts/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
