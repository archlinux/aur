# Maintainer: KopfKrieg <archlinux [at] absolem [dot] cc> 

pkgname=python-gnupg-isis
_gitname=python-gnupg
pkgver=2.2.0
pkgrel=2
pkgdesc='A modified version of python-gnupg, including security patches, extensive documentation, and extra features. The gnupg module allows Python programs to make use of the functionality provided by the GNU Privacy Guard.'
url='https://github.com/isislovecruft/python-gnupg'
license=('GPL3')
arch=('any')
depends=('python' 'gnupg' 'python-psutil')
conflicts=('python-gnupg')
provides=('python-gnupg')
replaces=('python-gnupg-ng')
source=('git://github.com/isislovecruft/python-gnupg.git')
md5sums=('SKIP')

build() {
  cd $_gitname
  git checkout $pkgver
  python setup.py build
}

package() {
  cd $_gitname
  git checkout $pkgver
  python setup.py install --root=${pkgdir} --optimize=1
}
