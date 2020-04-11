# Maintainer: Joseph Smidt <josephsmidt@gmail.com>
pkgname=nishang-git
pkgver=r335.eb25ca3
pkgrel=1
pkgdesc="A collection of scripts and payloads which enables usage of PowerShell for offensive security."
arch=('any')
url="https://github.com/samratashok/nishang"
license=('GPL')
makedepends=('git')
conflicts=('nishang')

source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}" 
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  install -dm0755 "${pkgdir}/usr/share/nishang"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/nishang/LICENSE"
  cp -ar --no-preserve=ownership ./* "${pkgdir}/usr/share/nishang"
}
