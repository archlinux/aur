# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Chris Lane <aur at chrislane dot com>
# Contributor: American_Jesus <american.jesus.pt AT gmail DOT com>
# Contributor: Federico Damián <federicodamians@gmail.com>
pkgname=vimix-icon-theme
_pkgver=2025-08-26
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Material Design icon theme based on Paper Icon Theme"
arch=('any')
url="https://github.com/vinceliuice/vimix-icon-theme"
license=('CC-BY-SA-4.0')
depends=(
  'gtk-update-icon-cache'
  'hicolor-icon-theme'
)
options=('!strip')
source=("$pkgname-${_pkgver}.tar.gz::$url/archive/${_pkgver}.tar.gz")
sha256sums=('b9403dea551556f7831f74141721df717d7098aa4136f4f43aaaee0e38b1229b')

prepare() {
   cd "Vimix-icon-theme-${_pkgver}"

  # Disable running gtk-update-icon-cache
  sed -i '/gtk-update-icon-cache/d' install.sh
}

package() {
  cd "Vimix-icon-theme-${_pkgver}"
  install -d "$pkgdir/usr/share/icons"
  ./install.sh -a -d "$pkgdir/usr/share/icons"

  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
