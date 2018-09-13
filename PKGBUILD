# Maintainer: f440 <freq440@gmail.com>

pkgname=ghq-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Remote repository management made easy. Pre-compiled."
arch=('x86_64')
url="https://github.com/motemen/ghq"
license=('MIT')
depends=()
provides=('ghq')
conflicts=('ghq')

source=("https://github.com/motemen/ghq/releases/download/v${pkgver}/${pkgname/-bin/}_linux_amd64.zip")
sha1sums=('6e6688d92024c99c1257bf663a114385f1c82f06')

package() {
  curl -O "https://raw.githubusercontent.com/motemen/ghq/v${pkgver}/LICENSE"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/ghq-bin/LICENSE"
  install -Dm755 "ghq" "${pkgdir}/usr/bin/${pkgname/-bin/}"
  install -Dm644 "zsh/_ghq" "${pkgdir}/usr/share/zsh/site-functions/_ghq"
}
