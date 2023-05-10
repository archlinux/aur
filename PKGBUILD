# Contributor: madhogs <madhogs at protonmail dot com>
# Contributor: grimi <grimi at poczta dot fm>

pkgname=xcursor-numix
_commit=1a236bbbb2eaeda027e4f0e4b096369db17a7224
pkgver=0.9.1
pkgrel=3
pkgdesc="An X-cursor-theme for use along with the numixproject products."
arch=('any')
url="https://www.gnome-look.org/p/999876/"
license=('GPL')
depends=('libxcursor')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/uloco/numix-cursor/archive/$_commit.tar.gz")
sha256sums=('b26d9c026a3aadfb54ccb62f30cec84ce5ad956ee2068a3177a0309e9c7b6f6b')

package() {
  cd "numix-cursor-$_commit"/theme
  find Numix-Cursor/ -type f -not -name "*~" \
      -exec install -Dm644 "{}" "${pkgdir}/usr/share/icons/{}" \;
  find Numix-Cursor/ -type l \
      -exec cp -d "{}" "${pkgdir}/usr/share/icons/{}" \;
}

