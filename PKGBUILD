# Maintainer: f440 <freq440@gmail.com>

pkgname=ghq-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Remote repository management made easy. Pre-compiled."
arch=('x86_64')
url="https://github.com/motemen/ghq"
license=('MIT')
depends=()
provides=('ghq')
conflicts=('ghq')

source=("${pkgname/-bin/}-${pkgver}_linux_amd64.zip::https://github.com/motemen/ghq/releases/download/v${pkgver}/${pkgname/-bin/}_linux_amd64.zip")
sha1sums=('4f2c3b5a62274e25b3a926ac781ec26fc5501bf6')

package() {
  curl -O "https://raw.githubusercontent.com/motemen/ghq/v${pkgver}/LICENSE"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/ghq-bin/LICENSE"
  install -Dm755 "${pkgname/-bin/}_linux_amd64/ghq" "${pkgdir}/usr/bin/${pkgname/-bin/}"
  install -Dm644 "${pkgname/-bin/}_linux_amd64/misc/zsh/_ghq" "${pkgdir}/usr/share/zsh/site-functions/_ghq"
}
