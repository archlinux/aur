# Maintainer: Tilmann Meyer <allescrafterx@gmail.com>
pkgname=angular-console-bin
_pkgname=angularconsole
depends=(fontconfig libxtst gtk3 cairo alsa-lib nss gcc-libs python libxss gconf)
pkgver=8.0.0
pkgrel=1
pkgdesc='Angular Console is the user interface for the Angular CLI'
arch=('x86_64')
url='https://github.com/nrwl/angular-console'
license=('MIT')
provides=('angular-console')
source=("$url/releases/download/v${pkgver}/${_pkgname}-${pkgver}.deb")
sha256sums=('b3a9734829c808c0853f2b9a87ba06242bf45293c241881e654b5ecb69112cac')

package() {
  cd "$srcdir/"
  tar -xf data.tar.xz
  cp -r usr/ $pkgdir
  cp -r opt/ $pkgdir
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/512x512/apps"

  install -m644 "usr/share/icons/hicolor/0x0/apps/angular-console.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/angular-console.png"

  install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$_pkgname <<END
#!/usr/bin/bash
/opt/Angular\ Console/angular-console
END
}
