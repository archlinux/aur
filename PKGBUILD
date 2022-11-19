## NOTE: Taken this over just to update; 
## NOTE: However, it should be noted upstream is a mess, 
## NOTE: Versioning does not match, as tags are "0.4.0" for the most recent "release".
## NOTE: However, "https://pypi.org/project/sox/#history" shows "0.4.0" is actually 1.4.1;
## NOTE: As such, i picked a newer commit. as its newer then PyPi and should be more compatible with Archlinux Libs.
##
## Maintainer: EndlessEden
##
## Previous Maintainer: xantares 
##
pkgname=python-sox
pkgver=1.4.2
pkgrel=2
pkgdesc="Python wrapper around SoX"
url="https://github.com/rabitt/pysox"
arch=(any)
license=('MIT')
makedepends=('python-setuptools' 'git')
depends=('python' 'sox')
#source=("https://pypi.io/packages/source/s/sox/sox-${pkgver}.tar.gz")
#md5sums=('36353e16e54b463e76877a408ef89318')
source=("sox-$pkgver::git+https://github.com/rabitt/pysox#commit=0a428b88f76c41e93eecbf49bb27b97c7b3f9de7")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}"/sox-$pkgver
}

build() {
  cd "${srcdir}"/sox-$pkgver
  python setup.py build
}

package_python-sox() {
  cd "${srcdir}/sox-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}


