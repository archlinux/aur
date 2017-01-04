# Maintainer: dobragab <dobragab@gmail.com>

pkgname='cinnamon-applet-starkmenu-git'
pkgver=r184.b3a810b
pkgrel=1
pkgdesc='Cinnamon applet. Custom Menu for Linux Cinnamon based off of physics Windows 7 Menu.'
arch=('any')
url='https://github.com/NikoKrause/CinnXPStarkMenu'
license=('GPL')
depends=('cinnamon')
makedepends=('git')
provides=('cinnamon-applet-starkmenu-git')
conflicts=('cinnamon-applet-starkmenu-git')
source=("${pkgname}::git+https://github.com/NikoKrause/CinnXPStarkMenu.git")
md5sums=(SKIP)
_appletname='CinnXPStarkMenu@NikoKrause'
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
