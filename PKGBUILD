# Maintainer:
pkgname=luxtrust-middleware
pkgver=1.4.1
pkgrel=1
pkgdesc="Gemalto PKCS#11 driver"
url="https://www.luxtrust.lu/en/simple/225"
arch=(x86_64)
depends=(
  'libclassicclient>=7.3.0_b06.01'
)
source_x86_64=("https://www.luxtrust.lu/downloads/middleware/LuxTrust_Middleware_${pkgver}_Ubuntu_64bit.tar.gz")
sha256sums_x86_64=('2b27b873f223f254b37fcc6ae9b21e5bb48ac081b0845be0f3bee10d8a377eff')

prepare() {
  cd "$srcdir"

  case $CARCH in
    x86_64)
      bsdtar -xf luxtrust-middleware-${pkgver}-64.deb;;
  esac

  bsdtar -xf data.tar.xz
}

package() {
  cd "$srcdir"

  cp -a opt "$pkgdir"/

  cd "$pkgdir"
  echo "$pkgdir"

  install -D -m 644 opt/LuxTrustMiddleware/LuxTrustMiddleware.desktop \
                    "$pkgdir"/usr/share/applications/LuxTrustMiddleware.desktop
}

# vim: ft=sh:ts=2:sw=2:et:nowrap
