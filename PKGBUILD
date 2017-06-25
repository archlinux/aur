# Maintainer: dobragab <dobragab@gmail.com>

pkgname='cinnamon-applet-starkmenu-git'
pkgver=r227.3f4856d
pkgrel=1
pkgdesc='Cinnamon applet. Custom Menu for Linux Cinnamon based off of physics Windows 7 Menu.'
arch=('any')
url='https://github.com/NikoKrause/CinnVIIStarkMenu'
license=('GPL')
depends=('cinnamon')
makedepends=('git')
provides=('cinnamon-applet-starkmenu-git')
conflicts=('cinnamon-applet-starkmenu-git')
source=("${pkgname}::git+https://github.com/NikoKrause/CinnVIIStarkMenu.git")
md5sums=(SKIP)
_appletname='CinnVIIStarkMenu@NikoKrause'
_appletdir="usr/share/cinnamon/applets/${_appletname}"

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"
  install -dm755 "$pkgdir/$_appletdir"
  find * -type f -exec install -Dm644 {} $pkgdir/$_appletdir/ \;
}
