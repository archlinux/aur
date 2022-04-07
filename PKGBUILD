# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>
_pkgname=sfxr-qt
pkgname=sfxr-qt-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Qt port of SFXR, a sound effect generator, to generate retro-gaming like sound effects"
arch=('x86_64')
url="https://github.com/agateau/sfxr-qt"
license=('MIT')
depends=('qt5-declarative' 'sdl' 'hicolor-icon-theme')
provides=('sfxr-qt')
conflicts=('sfxr-qt' 'sfxr-qt-git')
source=("https://github.com/agateau/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.bz2")
sha256sums=('3b34b509c307f2982a1882436bb96a7378445747cf1eeae230ba01e5b782f659')

package() {
  cd "$_pkgname-$pkgver"
  install -d "$pkgdir/usr"

  cp -Trf "inst" "$pkgdir/usr"
  rm -f "$pkgdir/usr/share/icons/hicolor/icon-theme.cache"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
