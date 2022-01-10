# Maintainer: Shreyans Jain <shreyansthebest2007@gmail.com>

pkgname=google-assistant-unofficial-desktop-client-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A cross-platform unofficial Google Assistant Client for Desktop (powered by Google Assistant SDK)"
arch=('x86_64')
url="https://github.com/Melvin-Abraham/Google-Assistant-Unofficial-Desktop-Client"
license=('Apache')
depends=('gtk3' 'libxss' 'nss')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$url/releases/download/v$pkgver/Google-Assistant-Setup-$pkgver-amd64.deb")
sha256sums=('5c6101ea07ed637ae7f2504a8115465ab22c9218e14023245391461597c948de')

package() {
  bsdtar -xvf data.tar.xz -C "$pkgdir"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/Google Assistant/${pkgname%-bin}" "$pkgdir/usr/bin/"
}
