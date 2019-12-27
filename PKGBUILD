# Maintainer: Lukas Deutz <lukas dot deutz at mailfence dot com>

pkgname=veonim
pkgver=0.22.0
pkgrel=1
pkgdesc='Simple modal IDE built on neovim'
arch=('x86_64')
url='https://github.com/veonim/veonim'
license=('MIT')
depends=('neovim')
source=("https://github.com/$pkgname/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.zip"
        "$pkgname.desktop"
        "$pkgname.sh"
        "logo.png")
sha256sums=('becde5667e899ef1611e299c535619315154e86627b4ac89d73a9c2e1cd33319'
            '3c1032e45722e72659edbba1ba1430c31954650dd090efd1b4ecddf933534189'
            '6e10d13d978b1331a92d486ef5515d831b78274bc047ed8c16d54d0046a73eda'
            '2e7644443ef226da71af4f07564e46c220f4b02cf5bc799427b5c15ee3bbca74')

prepare() {
  rm "$pkgname-$pkgver.zip"
}

package() {
  install -d "$pkgdir/opt"
  cp -R "$srcdir" "$pkgdir/opt/$pkgname"

  install -d "${pkgdir}/usr/bin"

  install -D -m755 "./${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${srcdir}/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -D -m644 "${srcdir}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
  install -D -m644 "./${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "./logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
