# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=chantools-bin
pkgver=0.14.3
pkgrel=1
pkgdesc="Tools for lnd and Lightning Network channel recovery"
arch=('x86_64' 'aarch64')
url="https://github.com/lightninglabs/chantools"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/lightninglabs/chantools/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/chantools-linux-amd64-v${pkgver}.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/chantools-linux-arm64-v${pkgver}.tar.gz")
sha256sums=('2e3b565e46f6b49853dc0e4be0e839316c7f07557e91bd50f9aa35f8d2220a61')
sha256sums_x86_64=('920a7a426211e714a91cba490a366b983b1d5fd10902d101b131c2111f0833bf')
sha256sums_aarch64=('967686a63a796b8f7c68340f9c298a5531253a30d25241da6f00dd27d48018e7')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="chantools-linux-amd64-v${pkgver}" ;;
    aarch64) _dir="chantools-linux-arm64-v${pkgver}" ;;
  esac
  install -Dm755 "${_dir}/chantools" "${pkgdir}/usr/bin/chantools"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
