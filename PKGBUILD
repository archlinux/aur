# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=tela-icon-theme
_pkgver=2026-07-07
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A flat colorful design icon theme."
arch=('any')
url="https://github.com/vinceliuice/Tela-icon-theme"
license=('GPL-3.0-or-later')
depends=(
  'gtk-update-icon-cache'
  'hicolor-icon-theme'
)
options=('!strip')
source=("$pkgname-${_pkgver}.tar.gz::$url/archive/${_pkgver}.tar.gz")
sha256sums=('6b8c28f637067a15551459ab90e6720c5aba1215b777b6f1f506fea188a1ddf9')

prepare() {
  cd "Tela-icon-theme-${_pkgver}"

  # Disable running gtk-update-icon-cache
  sed -i '/gtk-update-icon-cache/d' install.sh
}

package() {
  cd "Tela-icon-theme-${_pkgver}"
  install -d "$pkgdir/usr/share/icons"
  ./install.sh -a -d "$pkgdir/usr/share/icons"
}
