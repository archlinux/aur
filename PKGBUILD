# Maintainer: Javier Tia <javier.tia@gmail.com>
pkgname=office-code-pro
_srcname=Office-Code-Pro
pkgver=1.004
pkgrel=1
depends=(fontconfig xorg-font-utils)
pkgdesc="Office Code Pro is a customized version of Source Code Pro for text editors and coding environments"
url="https://github.com/nathco/Office-Code-Pro"
license=(custom)
arch=(any)

source=("https://github.com/nathco/$_srcname/archive/$pkgver.tar.gz")
sha256sums=('9bca923d17f6c47a586d8e4567d46ccfa58fb8b8e2247b5ee2a19da1597c58f6')

install=$pkgname.install

package() {
  install -Dm644 $srcdir/$_srcname-$pkgver/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "$pkgdir/usr/share/fonts/OTF/"
  cd $srcdir/$_srcname-$pkgver/Fonts/Office\ Code\ Pro/OTF/
  install -t "$pkgdir/usr/share/fonts/OTF/" -m644 *.otf

  cd $srcdir/$_srcname-$pkgver/Fonts/Office\ Code\ Pro\ D/OTF/
  install -t "$pkgdir/usr/share/fonts/OTF/" -m644 *.otf
}

# vim:set ts=2 sw=2 et:
