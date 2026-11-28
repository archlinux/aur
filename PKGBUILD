# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=bough-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Record what Claude Code, Codex and Pi do"
arch=('x86_64' 'aarch64')
url="https://github.com/nickelsec/bough"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/bough_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/bough_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('0b8933b9ceaa7019b5accf6866b631a7210fae4d900b79aa53cb838470c341df')
sha256sums_aarch64=('f8c950fe04f04d9e8aa8b64e94d2360aa98bcb7e952c5bcc0783eec8349715b8')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="bough_v${pkgver}_linux_amd64" ;;
    aarch64) _dir="bough_v${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/bough" "${pkgdir}/usr/bin/bough"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
