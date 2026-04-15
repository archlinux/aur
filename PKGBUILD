# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
pkgname=nuclei-templates
pkgver=10.4.2
pkgrel=1
pkgdesc="Templates for the nuclei engine to find security vulnerabilities"
arch=('any')
url="https://github.com/projectdiscovery/nuclei-templates"
license=('MIT')
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5f416b77da1397adb0e19aedf1b2744dc715673465c64b3031b53ad31a1bf6c9')

package() {
  cd "$pkgname-$pkgver"

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  mv LICENSE* "$pkgdir/usr/share/licenses/$pkgname"

  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  mv README* "$pkgdir/usr/share/doc/$pkgname"

  install -dm755 "$pkgdir/usr/share/nuclei-templates"
  cp -dpr --no-preserve=ownership * "$pkgdir/usr/share/nuclei-templates"
}

# vim: ts=2 sw=2 et:
