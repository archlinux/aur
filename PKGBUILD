# Maintainer: Yohann D'ANELLO <ynerant@crans.org>

pkgname=woke-bin
pkgver=0.18.1
pkgrel=1
pkgdesc="Detect non-inclusive language in your source code. Pre-compiled."
arch=('amd64' 'arm64' 'x86_64')
url="https://getwoke.tech/"
license=('MIT')
conflicts=('woke')
provides=('woke')
source_amd64=("https://github.com/get-woke/woke/releases/download/v${pkgver}/woke-${pkgver}-linux-amd64.tar.gz")
source_arm64=("https://github.com/get-woke/woke/releases/download/v${pkgver}/woke-${pkgver}-linux-arm64.tar.gz")
source_x86_64=("https://github.com/get-woke/woke/releases/download/v${pkgver}/woke-${pkgver}-linux-386.tar.gz")
sha256sums_amd64=("5fa5780858a45ecfa9e8d597c17bb231da9af4b7bc2c7c3150f00e28f3d7de9f")
sha256sums_arm64=("8294eff862047078b3771f9e63aeb8ebd84073e6a8f870d5239411c3fc94a2ca")
sha256sums_x86_64=("e79d1e6edff135769f371aa8cfa9ae8e2dbc14823baeaec22638d232b6d6e7a9")

package() {
  if [ $CARCH == 'x86_64' ]; then
    ARCH='386'
  else
    ARCH=$CARCH
  fi

  cd ${pkgname/-bin/}-$pkgver-linux-$ARCH
  install -vDm 755 ${pkgname/-bin/} -t "${pkgdir}/usr/bin"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname/-bin/}"
}
