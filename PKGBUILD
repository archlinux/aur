# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=oak-keyring-bin
pkgver=0.8.0preview.3
pkgrel=1
pkgdesc="A local-first, keyboard-driven password manager"
arch=('x86_64' 'aarch64')
url="https://github.com/OpenKeyring/oak-keyring"
license=('MIT')
depends=('glibc' 'libgcc' 'xz')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_tag="v0.8.0-preview.3"
_dl="${url}/releases/download/${_tag}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ok-v0.8.0-preview.3-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ok-v0.8.0-preview.3-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('a3d52e5222471b2918f2410db94ce825996751c0c963eecde98f31071d6ccae2')
sha256sums_aarch64=('9527bfc52cc09ec7bd7556ac8f6309c82f7f2eca8a71e85746fd7031974d049c')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="ok-v0.8.0-preview.3-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="ok-v0.8.0-preview.3-aarch64-unknown-linux-gnu" ;;
  esac
  cd "$_dir"
  install -Dm755 "ok" "${pkgdir}/usr/bin/ok"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README-ZH.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
