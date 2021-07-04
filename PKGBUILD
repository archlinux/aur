# Maintainer: Antoine POPINEAU <antoine at popineau dot eu>

pkgname=greetd-tuigreet-bin
pkgver=0.6.0
pkgrel=1

pkgdesc='A console UI greeter for greetd'
url='https://github.com/apognu/tuigreet'
license=(GPL3)
conflicts=(greetd-tuigreet greetd-tuigreet-git)

arch=(x86_64)

source=("https://github.com/apognu/tuigreet/releases/download/${pkgver}/tuigreet-${pkgver}-x86_64"
        "https://raw.githubusercontent.com/apognu/tuigreet/${pkgver}/LICENSE"
        'tuigreet.conf')
sha256sums=('f451f2731254df864b8dce3d41527c6995ebd5d1faa42c747987a5757403efe2'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '8f83aee7874aab5d06981a1d1cd05df906368a79dbca90d157a33a2f023b67d3')

package() {
  install -Dm755 "${srcdir}/tuigreet-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/tuigreet"
  install -Dm755 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/tuigreet/LICENSE"

  install -Dm644 "${srcdir}/tuigreet.conf" "${pkgdir}/usr/lib/tmpfiles.d/tuigreet.conf"
}
