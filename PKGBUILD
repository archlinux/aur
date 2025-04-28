# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>
_pkgname=sfxr-qt
pkgname=sfxr-qt-bin
pkgver=1.5.1
pkgrel=2
pkgdesc="Qt port of SFXR, a sound effect generator, to generate retro-gaming like sound effects"
arch=('x86_64')
url="https://github.com/agateau/sfxr-qt"
license=('MIT')
depends=('qt5-quickcontrols' 'qt5-quickcontrols2' 'sdl' 'hicolor-icon-theme')
optdepends=('plasma5-integration: plasma qt5 theme support')
provides=('sfxr-qt')
conflicts=('sfxr-qt')
source=("https://github.com/agateau/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.bz2")
sha256sums=('a3f91312dc38b226b133c3778141232e3e10b374d2e844006f6c8494da1ac878')

package() {
  cd "$_pkgname-$pkgver"
  install -d "$pkgdir/usr"

  cp -Trf "inst" "$pkgdir/usr"
  rm -f "$pkgdir/usr/share/icons/hicolor/icon-theme.cache"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
