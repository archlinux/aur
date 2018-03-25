# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=evolvere-icons-git
pkgver=r247.g56a331e
pkgrel=1
pkgdesc='Evolvere icons 2, flat with touches of realism'
arch=('any')
url="https://github.com/franksouza183/Evolvere-Icons"
license=('CC-BY-4.0')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
options=(!strip)
source=("${pkgname%-*}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d ${pkgdir}/usr/share/icons/
  install -Dm644 ${pkgname%-*}/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  rm -rf ${pkgname%-*}/{LICENSE,*.md,*.png,adjust-*,.git}
  cp -r ${pkgname%-*} ${pkgdir}/usr/share/icons/${pkgname%-*}-2
}
