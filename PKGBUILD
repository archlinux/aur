# Maintainer: Insidious Fiddler <aur[at]codycody31[dot]dev>
pkgname=dyad-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Free, local, open-source AI app builder"
arch=('x86_64')
url="https://github.com/dyad-sh/dyad"
license=('Apache-2.0')
depends=('gtk3' 'libsecret' 'webkit2gtk' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('libarchive')
optdepends=('desktop-file-utils: for updating desktop database')
source=("https://github.com/dyad-sh/dyad/releases/download/v${pkgver}/dyad_${pkgver}_amd64.deb")
sha256sums=('686ff23f69725e11e9e65aa07cc2e7173dfdcbde19bb94205e22f9dedc5b005d')

# ci/cd flag: gh repo for auto updates
_ghrepo="dyad-sh/dyad"

package() {
  cd "$srcdir"

  bsdtar -xf "dyad_${pkgver}_amd64.deb"
  bsdtar -xf data.tar.* -C "$pkgdir"

  install -Dm644 /dev/null "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # Note: License text available at https://github.com/dyad-sh/dyad/blob/main/LICENSE
}
