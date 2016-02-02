# Maintainer: kevku <kevku@gmx.com>
pkgname=esteidpkcs11loader
_browser=firefox
pkgver=3.12.0.1063
pkgrel=1
pkgdesc="Firefox PKCS#11 module loader"
arch=('any')
url="http://www.id.ee/"
license=('LGPL')
depends=('opensc' 'pcsclite' 'ccid')
makedepends=('cmake' 'unzip' 'zip')
source=("https://installer.id.ee/media/ubuntu/pool/main/e/$pkgname/${pkgname}_$pkgver.orig.tar.xz")
sha256sums=('fb2aef40bc45a10a4a685d57c125690a8ab647f433715232e88db568da02edcc')
validpgpkeys=('43650273CE9516880D7EB581B339B36D592073D4')

package() {
  cd "$srcdir/"
  
  install -Dm644 "chrome/content/browser.xul" "$pkgdir/usr/share/xul-ext/esteidpkcs11loader/chrome/content/browser.xul"
  install -Dm644 "chrome/content/id-32.png" "$pkgdir/usr/share/xul-ext/esteidpkcs11loader/chrome/content/id-32.png"
  install -Dm644 "chrome/content/pkcs11-loader.js" "$pkgdir/usr/share/xul-ext/esteidpkcs11loader/chrome/content/pkcs11-loader.js"
  
  install -Dm644 "META-INF/manifest.mf" "$pkgdir/usr/share/xul-ext/esteidpkcs11loader/META-INF/manifest.mf"
  install -Dm644 "META-INF/mozilla.rsa" "$pkgdir/usr/share/xul-ext/esteidpkcs11loader/META-INF/mozilla.rsa"
  install -Dm644 "META-INF/mozilla.sf" "$pkgdir/usr/share/xul-ext/esteidpkcs11loader/META-INF/mozilla.sf"
  
  install -Dm644 "chrome.manifest" "$pkgdir/usr/share/xul-ext/esteidpkcs11loader/chrome.manifest"
  install -Dm644 "install.rdf" "$pkgdir/usr/share/xul-ext/esteidpkcs11loader/install.rdf"
  
  mkdir -p "$pkgdir/usr/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"
  ln -sf "/usr/share/xul-ext/esteidpkcs11loader" "$pkgdir/usr/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}/{aa84ce40-4253-a00a-8cd6-0800200f9a67}"
  
}
