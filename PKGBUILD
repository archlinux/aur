# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Milo Mirate <mmirate at gmx dot com>
_pkgname=pyassuan
pkgname=python-pyassuan-git
pkgver=48.b18cb7f
pkgrel=1
pkgdesc="Tools for communicating in the Assuan protocol."
arch=('any')
url="https://blog.tremily.us/posts/pyassuan/"
license=('GPL3')
depends=('python')
makedepends=('git')
provides=('python-pyassuan')
conflicts=('python-pyassuan')
options=(!emptydirs)
source=('git+http://http-git.tremily.us/pyassuan.git')
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  echo 'Building python...'
  cd $_pkgname
  python setup.py build
}

package() {
  cd $_pkgname
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}