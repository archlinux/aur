# Maintainer: ponies <ponies@ponies.top>

pkgname=pandoc-themes
pkgrel=1
pkgver=1
pkgdesc="General purpose themes for converting markdown to pdf using pandoc."
arch=('any')
url="https://github.com/cab-1729/Pandoc-Themes"
license=('GPL3')
makedepends=('git')
depends=('texlive-bin' 'pandoc-bin')
install=pandoc-themes.install

source=(
  "git+https://github.com/cab-1729/Pandoc-Themes"

)

sha256sums=(
  'SKIP'
)

package() {
  install -dm755 "${pkgdir}/usr/share/pandoc/data/templates"
  install -dm755 "${pkgdir}/usr/share/fonts"

  find "${srcdir}/Pandoc-Themes" -name "*.tex" -exec \
    cp {} "${pkgdir}/usr/share/pandoc/data/templates/" \;

  cp -R "${srcdir}/Pandoc-Themes/pandoc-fonts" "${pkgdir}/usr/share/fonts"
}
