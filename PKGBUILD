# Maintainer: Insidious Fiddler <aur[at]codycody31[dot]dev>
pkgname=dyad-bin
pkgver=0.39.0
pkgrel=1
pkgdesc="Free, local, open-source AI app builder"
arch=('x86_64')
url="https://github.com/dyad-sh/dyad"
license=('Apache-2.0')
depends=('gtk3' 'libsecret' 'webkit2gtk' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('libarchive')
optdepends=('desktop-file-utils: for updating desktop database')
source=("https://github.com/dyad-sh/dyad/releases/download/v${pkgver}/dyad_${pkgver}_amd64.deb")
sha256sums=('fbc46467905c88302da04547ed4e526841ce18c9ff1417f1df6b4ddf03df35de')

# ci/cd flag: gh repo for auto updates
_ghrepo="dyad-sh/dyad"

package() {
  cd "$srcdir"

  bsdtar -xf "dyad_${pkgver}_amd64.deb"
  bsdtar -xf data.tar.* -C "$pkgdir"

  install -Dm644 /dev/null "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # Note: License text available at https://github.com/dyad-sh/dyad/blob/main/LICENSE
}
