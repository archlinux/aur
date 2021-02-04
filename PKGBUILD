# Maintainer: Amos Onn <amosonn at gmail dot com>

pkgname=firefox-userchromejs
_pkgname=Quantum-Nox-Firefox-Dark-Full-Theme
pkgver=1.7.10
_pkgver=FF84
pkgrel=1
pkgdesc="Patching Firefox to enable JS injection (userchrome-js)"
arch=('any')
depends=('firefox')
url="https://github.com/Izheil/Quantum-Nox-Firefox-Dark-Full-Theme/tree/master/Multirow%20and%20other%20functions/JS%20Loader"
license=('MPL2')
source=(https://codeload.github.com/Izheil/$_pkgname/tar.gz/$_pkgver)
sha512sums=('04873a15fc6ea580029751b6d9a7efdc1d8fb443e125f6875f71efe48b3f276e5efd020db6d59e39ae420156a0087090ad7d55d2d6692970e2c98e191258d8f3')
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
