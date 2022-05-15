# Maintainer: Yohann D'ANELLO <ynerant@crans.org>

pkgname=woke-bin
pkgver=0.18.2
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
sha256sums_amd64=("da0372dc33f45a56265abce127a2b9ed34cef9cfe85110b2fb6981db630a0416")
sha256sums_arm64=("fa545e7fd0b2bbae1bc85b67b360c24cd8892b8aef1bffb538c215c6e532a1ff")
sha256sums_x86_64=("97450250965ae952b5e0d7b7c6a15388ac657b6ebdb42f869dfc06384cbd771b")

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
