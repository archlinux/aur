# Maintainer: kobe-koto <k@koto.cc>

pkgname=grub-theme-lobo-git
_theme=Lobo
pkgver=r18.4c5b99e
pkgrel=1
pkgdesc="Lobo Grub Theme"
url="https://github.com/rats-scamper/LoboGrubTheme"
arch=('any')
license=('GPL-3.0')
depends=('grub-common')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_theme}GrubTheme" # Or "$_pkgname" if you aliased it in your source array
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -dm755 ${pkgdir}/usr/share/grub/themes
	cp -rf --no-preserve=ownership "${srcdir}/${_theme}GrubTheme/" ${pkgdir}/usr/share/grub/themes/${_theme}
}
