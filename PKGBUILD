# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>
_pkgname=sfxr-qt
pkgname=sfxr-qt-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Qt port of SFXR, a sound effect generator, to generate retro-gaming like sound effects"
arch=('x86_64')
url="https://github.com/agateau/sfxr-qt"
license=('MIT')
depends=('qt5-declarative' 'sdl' 'hicolor-icon-theme')
provides=('sfxr-qt')
conflicts=('sfxr-qt' 'sfxr-qt-git')
source=("https://github.com/agateau/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.bz2")
sha256sums=('b68a51c42b59daa03a79ecfa05cfcb3b5019dc9c1c197b2434f13d32d162483f')

package() {
  cd "$_pkgname-$pkgver"
  install -d "$pkgdir/usr"

  cp -Trf "inst" "$pkgdir/usr"
  rm -f "$pkgdir/usr/share/icons/hicolor/icon-theme.cache"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
