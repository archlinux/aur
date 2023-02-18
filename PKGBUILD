# Maintainer: Emmy D'Anello <ynerant@crans.org>

pkgname=woke-bin
pkgver=0.19.0
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
sha256sums_amd64=("db5ed0906c81323a8c478cc57e00301dbf184db7a0293d70ba9f4729b6169d8c")
sha256sums_arm64=("b0981727ec24a34741184560e344416dd530dad0d802e96fa5675fe40557e57d")
sha256sums_x86_64=("e5ee4e822e18110f70b67be492b41289622dd02b15f4792f73c114b13d36e9db")

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
