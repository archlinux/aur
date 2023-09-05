# Maintainer: Shyam <contact at via dot aur>
pkgname=nishang-scripts
_pkgver=nishang
pkgver=d87229d
pkgrel=1
pkgdesc="Nishang is a framework and collection of scripts and payloads used during penetration testing tasks."
arch=('any')
url="https://github.com/samratashok/nishang"
license=('MIT')
depends=('powershell')
makedepends=('git')
provides=('nishang-scripts')
conflicts=('nishang-git')

source=("git+https://github.com/samratashok/nishang.git")

pkgver() {
  cd "$_pkgver"
  git log --pretty=format:'{%n  "commit": "%H"}' | head -n 2| jq .commit -r | cut -c 1-7
}

package() {
  cd "${srcdir}/${_pkgver}"
  install -dm0755 "${pkgdir}/usr/share/nishang"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/nishang/LICENSE"
  cp -ar --no-preserve=ownership ./* "${pkgdir}/usr/share/nishang"
}
sha256sums=('SKIP')
