# Contributor: Richard Kakaš <richard.kakas@gmail.com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=printrun
pkgver=20150310
pkgrel=1
_projectname='Printrun'
_gittag="printrun-${pkgver}"
pkgdesc='Pronterface, Pronsole, and Printcore - Pure Python 3D printing host software and GUI'
arch=('i686' 'x86_64')
url='https://github.com/kliment/Printrun'
license=('GPL')
provides=('printrun-git')
conflicts=('printrun-git')
depends=('python2-pyserial' 'wxpython' 'pyglet' 'desktop-file-utils')
optdepends=(
  'python2-cairo: to use Projector feature'
  'python2-cairosvg: to use Projector feature'
  'python2-numpy: for 3D view'
  'python2-dbus: to inhibit sleep when printing'
  'python2-psutil: to increase process priority when printing')
makedepends=('cython2')
install="${pkgname}.install"
source=("https://github.com/kliment/${_projectname}/archive/${_gittag}.tar.gz")
sha256sums=('6edaa533df5a590f55039b81e47f61881d2a47de07c3391d53bfb6d847f46d2e')

build() {
  cd "${srcdir}/${_projectname}-${_gittag}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_projectname}-${_gittag}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
