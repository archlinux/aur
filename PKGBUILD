# Maintainer: Julian Hornich <julianhornich@googlemail.com>

pkgname=kerncraft-git
pkgver=199.2
pkgrel=1
pkgdesc="Loop Kernel Analysis and Performance Modeling Toolkit"
arch=('i686' 'x86_64')
url="https://github.com/RRZE-HPC/kerncraft"
license=('GPLv3')
# iaca does currently not build from AUR. You might want to install it by hand and uncomment it here
depends=('python2>=2.7' 'python2-yaml' 'likwid' 'iaca' )
makedepends=('git')
optdepends=('intel-compiler-base' 'gcc' 'python2-matplotlib')
source=('git+https://github.com/RRZE-HPC/kerncraft.git')
sha256sums=('SKIP')
provides=('kerncraft')

pkgver() {
  cd ${srcdir}/kerncraft
  echo $(git rev-list --count master).${pkgrel}
}

package() {
  cd ${srcdir}/kerncraft
  python2 setup.py install --root="${pkgdir}"
  install -Dm644 ${srcdir}/kerncraft/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
