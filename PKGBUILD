# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=oxygen-sounds
pkgdesc='KDE Oxygen sound pack'
pkgver=5.21.3
pkgrel=1
arch=('any')
url='https://www.kde.org/workspaces/plasmadesktop/'
license=('LGPL')
source=("https://download.kde.org/stable/plasma/$pkgver/oxygen-$pkgver.tar.xz"{,.sig})
sha256sums=('0afcd178aaaedba660603f1177055db395af4d6693233bf31226ae4a3a0ed29b'
            'SKIP')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E') # Jonathan Riddell <jr@jriddell.org>

package() {
  cd "oxygen-$pkgver"
  for file in sounds/*.ogg; do
    install -Dvm 644 "$file" "$pkgdir/usr/share/$file"
  done
}
