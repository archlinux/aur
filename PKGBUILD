# Maintainer: Eric Cheng <ericcheng@hey.com>

pkgname=gnome-shell-extension-alphabetical-grid-extension
_pkgname=alphabetical-grid-extension
pkgver=11.0
pkgrel=1
pkgdesc="Restore the alphabetical ordering of the app grid, removed in GNOME 3.38 "
arch=('any')
url="https://github.com/stuarthayhurst/alphabetical-grid-extension"
license=('GPL3')
depends=('gnome-shell>=3.38')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('50238993911dcf0f6e4d60d83cbf5d55492dc3346945116225bec57f9f9b8b95')

build() {
  cd "${srcdir}"/${_pkgname}-${pkgver}
  make build
}

package() {
  cd "${srcdir}"/${_pkgname}-${pkgver}

  install -d "$pkgdir"/usr/share/gnome-shell/extensions/AlphabeticalAppGrid@stuarthayhurst
  unzip AlphabeticalAppGrid@stuarthayhurst.shell-extension.zip -d "$pkgdir"/usr/share/gnome-shell/extensions/AlphabeticalAppGrid@stuarthayhurst

  install -Dm644 "schemas/org.gnome.shell.extensions.AlphabeticalAppGrid.gschema.xml" -t "${pkgdir}/usr/share/glib-2.0/schemas/"
}