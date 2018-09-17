# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=zerotwo-bin
_pkgname=zerotwo-ui
pkgver=0.6.1
pkgrel=2
provides=("zerotwo")
conflicts=("zerotwo")
pkgdesc="AniList Anime Tracker - built with Electron & Vue.js"
arch=('x86_64')
url="https://www.zerotwo.org/"
license=('MIT')
depends=('nodejs' 'electron')
source=("https://github.com/NicoAiko/zerotwo/releases/download/v${pkgver}-beta/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('a1d2ac2efd2d37a6f2ce15ac662bb1dee7738a4f53845516381783bce370462c')

package() {
	cd "$srcdir/"
  ar x *.deb
  tar -xf data.tar.xz
  mv usr "${pkgdir}"
  mv opt "${pkgdir}"

  install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$_pkgname <<END
  #!/usr/bin/bash
  /opt/ZeroTwo/zerotwo-ui

END
}
