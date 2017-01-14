pkgname='numix-cinnamon-transparent-git'
pkgver=r69.dd371a4
pkgrel=1
pkgdesc="A Numix Theme for cinnamon; transparent and compact version "
arch=('any')
url='https://github.com/edoz90/numix-cinnamon-transparent'
license=('AGPL3')
source=("$pkgname::git+https://github.com/edoz90/numix-cinnamon-transparent.git")
md5sums=('SKIP')
depends=('cinnamon')
makedepends=('git')

pkgver() {
	  cd "${pkgname}"
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
      cd "${pkgname}"
        install -dm755 ${pkgdir}/usr/share/themes
	cp -R Numix-Cinnamon-Transparent ${pkgdir}/usr/share/themes/
}
