# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=genesis-starter
pkgver=6.1.6
pkgrel=1
arch=('any')
pkgdesc="Character creation tool for Splittermond"
url="http://blog.rpgframework.de"
license=('unknown')
depends=('java-runtime' 'freetype2' 'libxtst' 'alsa-lib' 'libnet' 'libxrender' 'xdg-utils')
source=("http://www.rpgframework.de/downloads/linux/genesis-$pkgver-1.x86_64.rpm"
        "${pkgname}.sh"
        "${pkgname}.desktop")
sha256sums=('a65f42bbfb134392ab4d74d50e33cea1f44fdf6ae204e6903e8975aeefd063a8'
            '50d8d2308c5727ab160a69c09c8e5f30f21c9159ef78ceff5c7cff33d3ec45c9'
            '30c582b5d315c01c78428eed5f2f43fd2667f1c23f9005964301de84dcbfa14e')

package() {
  # start script
  install -m755 -D "./${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  # stuff
  cp -r "$srcdir"/opt $pkgdir
  cp -r "$srcdir"/usr $pkgdir
  # menu entry
  install -m644 -D "./${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
