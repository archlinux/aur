# Maintainer: Amos Onn <amosonn at gmail dot com>

pkgname=firefox-userchromejs
#_pkgname=firefox-scripts
pkgver=155
_pkgver=FF155
pkgrel=2
pkgdesc="Patching Firefox to enable JS injection (userchrome-js)"
arch=('any')
depends=('firefox')
#url="https://github.com/xiaoxiaoflood/firefox-scripts"
url="https://github.com/Izheil/Quantum-Nox-Firefox-Customizations"
license=('MPL2')
source=(
  "https://github.com/Izheil/Quantum-Nox-Firefox-Customizations/archive/refs/tags/${_pkgver}.zip"
)
sha256sums=(
  '92b367f601f0bf506776657c8b3fcbe5ba79617676faaebcdf10a69f1f56add3'
)
install=firefox-userchromejs.install

package() {
  install -d "$pkgdir/usr/lib/firefox/browser/defaults/preferences"
  # For some other firefox installations
  #install -d "$pkgdir/usr/lib/firefox/defaults/pref"
  #install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -d "$pkgdir/usr/share/$pkgname/base/chrome/utils"
  #install -d "$pkgdir/usr/share/$pkgname/misc"

  cd "${srcdir}/Quantum-Nox-Firefox-Customizations-FF155/Multirow and other functions/JS Loader/root/"
  install -m 644 config.js "$pkgdir/usr/lib/firefox/"
  install -m 644 defaults/pref/config-prefs.js "$pkgdir/usr/lib/firefox/browser/defaults/preferences/"
  # For some other firefox installations
  #install config-prefs.js $pkgdir/usr/lib/firefox/defaults/pref/

  cd "${srcdir}/Quantum-Nox-Firefox-Customizations-FF155/Multirow and other functions/JS Loader/utils/"
  #install -m 644 BootstrapLoader.js "$pkgdir/usr/share/$pkgname/base/chrome/utils/"
  #install -m 644 ChromeManifest.sys.mjs "$pkgdir/usr/share/$pkgname/base/chrome/utils/"
  #install -m 644 RDFDataSource.sys.mjs "$pkgdir/usr/share/$pkgname/base/chrome/utils/"
  #install -m 644 RDFManifestConverter.sys.mjs "$pkgdir/usr/share/$pkgname/base/chrome/utils/"
  install -m 644 chrome.manifest "$pkgdir/usr/share/$pkgname/base/chrome/utils/"
  #install hookFunction.jsm "$pkgdir/usr/share/$pkgname/base/chrome/utils/"
  #install userChrome.jsm "$pkgdir/usr/share/$pkgname/base/chrome/utils/"
  install -m 644 userChrome.js "$pkgdir/usr/share/$pkgname/base/chrome/utils/"
  #install xPref.jsm "$pkgdir/usr/share/$pkgname/base/chrome/utils/"
  #install -m 644 versionInfo.json "$pkgdir/usr/share/$pkgname/base/chrome/utils/"
  install -m 644 xPref.sys.mjs "$pkgdir/usr/share/$pkgname/base/chrome/utils/"

  #cd "$srcdir/$_pkgname-$_pkgver/"
  #install -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
  #install -m 644 README.md "$pkgdir/usr/share/$pkgname/misc/"
  #find chrome -type f -exec install -m 644 -D "{}" "$pkgdir/usr/share/$pkgname/misc/{}" \;
  #find extensions -type f -exec install -m 644 -D "{}" "$pkgdir/usr/share/$pkgname/misc/{}" \;
}

# vim:set ts=2 sw=2 et:
