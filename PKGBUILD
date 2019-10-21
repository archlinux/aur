# Maintener : m242 m242@protonmail.com
# Fixed by metak
# All the font works is made by Jens Kutilek (https://github.com/jenskutilek)
pkgname=sudo-font-git
pkgver=0.40.r0.gf63cadf
pkgrel=1
pkgdesc="Monospaced font by jenskulitek"
url="https://www.kutilek.de/sudo-font/"
arch=('any')
license=('OFL')
depends=('fontconfig')
makedepends=(git)
source=("${pkgname%-*}::git+https://github.com/jenskutilek/sudo-font.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
}

package() {
  install -m 0755 -d "$pkgdir/usr/share/fonts/${pkgname%-*}"
  install -m 0644 -p "${pkgname%-*}"/sudo/*.ttf "$pkgdir/usr/share/fonts/${pkgname%-*}"
  install -Dm644 "${pkgname%-*}"/sudo/OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
