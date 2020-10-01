# Maintainer: Amos Onn <amosonn at gmail dot com>

pkgname=firefox-userchromejs
_pkgname=Quantum-Nox-Firefox-Dark-Full-Theme
pkgver=1.7.8
_pkgver=FF81
pkgrel=2
pkgdesc="Patching Firefox to enable JS injection (userchrome-js)"
arch=('any')
depends=('firefox')
url="https://github.com/Izheil/Quantum-Nox-Firefox-Dark-Full-Theme/tree/master/Multirow%20and%20other%20functions/JS%20Loader"
license=('MPL2')
source=(https://codeload.github.com/Izheil/$_pkgname/tar.gz/$_pkgver)
sha256sums=('9bf64567c0c1b9e4466cbf347531e82b4c4c2f4575e69c5ba6d8232deeea331e')
install=firefox-userchromejs.install

package() {
  cd $srcdir/$_pkgname-$_pkgver/
  install -d $pkgdir/usr/share/licenses/$pkgname
  install LICENSE $pkgdir/usr/share/licenses/$pkgname/

  cd Installers/Multirow\ \&\ other\ functions/root/
  install -d $pkgdir/usr/lib/firefox/defaults/pref
  install config.js $pkgdir/usr/lib/firefox/
  install defaults/pref/config-prefs.js $pkgdir/usr/lib/firefox/defaults/pref/

  cd ../
  install -d $pkgdir/usr/share/$pkgname/chrome/utils
  install utils/* $pkgdir/usr/share/$pkgname/chrome/utils/
}

# vim:set ts=2 sw=2 et:
