# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=tela-icon-theme
_pkgver=2024-04-19
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A flat colorful design icon theme."
arch=('any')
url="https://github.com/vinceliuice/Tela-icon-theme"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
options=('!strip')
source=("$pkgname-${_pkgver}.tar.gz::$url/archive/${_pkgver}.tar.gz")
sha256sums=('bff62334a443023a18225b27c045d782822761566bc06e3117a07de54aa11c0c')

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
