# Maintainer: Sebastian Gumprich <sebastian.gumprich@38.de>
pkgname=tuxemon-git
pkgver=r481.52c5a67
pkgrel=1
pkgdesc="A free, open source monster-fighting RPG."
arch=('i686' 'x86_64')
url="http://www.tuxemon.org"
license=('GPL3')
groups=('games')
depends=('python' 'python-pygame-hg' 'python-pytmx' 'python-yapsy' 'python-netifaces' 'python-neteria')
makedepends=('git')
optdepends=('libShake: rumble library for Linux.')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git://github.com/Tuxemon/Tuxemon.git')
md5sums=('SKIP')

_gitname=Tuxemon

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d ${pkgdir}/usr/share/
    install -d ${pkgdir}/usr/bin/
    mv ${srcdir}/${_gitname}/tuxemon/ ${pkgdir}/usr/share/tuxemon
    ln -s "/usr/share/tuxemon/tuxemon.py" "${pkgdir}/usr/bin/tuxemon"
}
