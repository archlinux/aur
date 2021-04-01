# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=vifm-devicons-git
_pkgname=vifm-devicons
pkgver=r9.da0db19
pkgrel=1
pkgdesc="File and directory icons for Vifm (git)"
url="https://github.com/cirala/vifm_devicons"
makedepends=('git')
optdepends=('nerd-fonts-source-code-pro: recommended by the author of original ranger_devicons project')
install=vifm-devicons-git.install
conflicts=(vifm-devicons)
license=('GPL')
arch=('any')
source=("${pkgname}"::'git+https://github.com/cirala/vifm_devicons.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm644 favicons.vifm "$pkgdir/usr/share/vifm-devicons/favicons.vifm"
  install -Dm644 README.md "$pkgdir/usr/share/doc/vifm-devicons/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/doc/vifm-devicons/LICENSE"
}

# vim:set ts=2 sw=2 et:
