# Maintainer: sdvcrx <memory.silentvoyage at gmail.com>

pkgname=clash-bin
_pkgname=clash
pkgver=0.8.0
pkgrel=1
pkgdesc="A rule based proxy in Go."
url="https://github.com/Dreamacro/clash"
license=("MIT")
arch=("x86_64")
provides=("clash")
conflicts=("clash" "clash-git")
depends=("glibc")
source=(clash@.service
        clash_user.service)
sha256sums=(
        "5742063861d24f959a6aed1eecbcdfde772e63dcf1e9104690d4255d6967e656"
        "71a8880111f577df201c8c73300616a01411f14a6a7d14a18c768e469dc71541"
)
source_x86_64+=("${url}/releases/download/v${pkgver}/clash-linux.gz")
sha256sums_x86_64+=('fcb81e6da02c26079e61390bd6b59733aa723d5d562e6d356ebd3caefd879a71')

install=$_pkgname.install

package() {
  cd "${srcdir}/"

  install -Dm755 clash-linux "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 clash@.service ${pkgdir}/usr/lib/systemd/system/clash@.service
  install -Dm644 clash_user.service ${pkgdir}/usr/lib/systemd/user/clash.service
}

