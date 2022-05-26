# Maintainer: czaplicki <dev dot czaplicki at icloud dot com>
pkgname='rofi-polkit-agent-git'
pkgver=r2.d0c5e52
pkgrel=1
pkgdesc="Polkit agent, using rofi for UI"
arch=('x86_64')
url="https://github.com/czaplicki/rofi-polkit-agent"
license=('MIT')
depends=('jq' 'polkit' 'cmd-polkit-git' 'rofi')
makedepends=('git')
source=("${pkgname}-${pkgver}::git+https://github.com/czaplicki/rofi-polkit-agent.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}-${pkgver}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 rofi-polkit-agent "$pkgdir/usr/bin/rofi-polkit-agent"
  install -Dm644 LICENSE           "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
