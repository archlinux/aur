# Maintainer: bartus <aur@bartus.33mail.com>
pkgname=blender-plugin-animation-nodes
name=animation_nodes
pkgver=2.0
pkgrel=2
pkgdesc="Node based visual scripting system designed for motion graphics in Blender."
arch=(i686 x86_64)
url="https://github.com/JacquesLucke/animation_nodes"
license=('GPL')
depends=(blender python-numpy)
makedepends=(cython)
options=()
source=("https://github.com/JacquesLucke/animation_nodes/archive/v2.0.tar.gz"
        )
md5sums=('a5e8d144323c4302b2dab8dca1b61b7d')

build() {
  cd ${srcdir}/${name}-${pkgver}
  python setup.py --nocopy --noversioncheck
}

package() {
  cd ${srcdir}
  addons="$pkgdir/usr/share/blender/$(blender -v | head -n1 | cut -f2 -d ' ')/scripts/addons"
  install -dm755 ${addons}/${name}
  cp -a -t ${addons}/${name} ${name}-${pkgver}/${name}/*
}

# vim:set sw=2 ts=2 et:
