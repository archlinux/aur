# Maintainer: Shyam <contact at via dot aur>
pkgname=nishang-scripts
_pkgver=nishang
pkgver=0.7.6.r54.gd87229d
pkgrel=1
pkgdesc="Nishang is a framework and collection of scripts and payloads used during penetration testing tasks."
arch=('any')
url="https://github.com/samratashok/nishang"
license=('MIT')
depends=('powershell')
makedepends=('git')
provides=('nishang-scripts')
conflicts=('nishang-git')

source=("git+https://github.com/samratashok/nishang.git#commit=d87229d2112456470ad30a50edbf312463f2b09a")

pkgver() {
  cd "$_pkgver"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_pkgver}"
  install -dm0755 "${pkgdir}/usr/share/nishang"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/nishang/LICENSE"
  cp -ar --no-preserve=ownership ./* "${pkgdir}/usr/share/nishang"
}
sha256sums=('SKIP')
