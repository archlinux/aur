# Contributor: Richard Kakaš <richard.kakas@gmail.com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=printrun
pkgver=1.6.0
pkgrel=3
epoch=1
_projectname='Printrun'
_gittag="printrun-${pkgver}"
pkgdesc='Pronterface, Pronsole, and Printcore - Pure Python 3D printing host software and GUI'
arch=('i686' 'x86_64')
url='https://github.com/kliment/Printrun'
license=('GPL')
provides=('printrun-git')
conflicts=('printrun-git')
depends=('python2-pyserial' 'wxpython' 'python2-pyglet' 'python2-numpy')
optdepends=(
  'python2-cairo: to use Projector feature'
  'python2-cairosvg: to use Projector feature'
  'python2-dbus: to inhibit sleep when printing'
  'python2-psutil: to increase process priority when printing')
makedepends=('cython2')
source=("https://github.com/kliment/${_projectname}/archive/${_gittag}.tar.gz")
sha256sums=('fefcb4c5793fc77205a14263bc915616cde0523cd60704f356191b9ae34ba65d')

build() {
  cd "${srcdir}/${_projectname}-${_gittag}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_projectname}-${_gittag}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
