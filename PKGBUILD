# Maintainer: Witt <fgwang.660@gmail.com>

pkgname=ttf-lucida-fonts
pkgver=v2.cf6fcb7
pkgrel=1
pkgdesc='Lucida TTF Fonts from Github'
arch=('any')
url="https://lucidafonts.com/"
provides=('ttf-font')
source=(git+https://github.com/witt-bit/lucida-fonts.git)
sha512sums=('SKIP')
license=('custom')

pkgver() {
  cd lucida-fonts
  printf "v%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d "${pkgdir}/usr/share/fonts/lucida-fonts/Lucida Sans" "${pkgdir}/usr/share/fonts/lucida-fonts/Lucida Sans Typewriter"
    install -m644 "${srcdir}/lucida-fonts/"*.ttf -D "${pkgdir}/usr/share/fonts/lucida-fonts/"
    install -m644 "${srcdir}/lucida-fonts/Lucida Sans/"*.ttf -D "${pkgdir}/usr/share/fonts/lucida-fonts/Lucida Sans/"
    install -m644 "${srcdir}/lucida-fonts/Lucida Sans Typewriter/"*.ttf -D "${pkgdir}/usr/share/fonts/lucida-fonts/Lucida Sans Typewriter/"
}
