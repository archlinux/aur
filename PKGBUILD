# Maintainer: KopfKrieg <archlinux [at] absolem [dot] cc> 
# Maintainer: robertfoster

pkgname=python-gnupg-isis
name=python-gnupg
pkgver=3.1.1
pkgrel=1
pkgdesc='A modified version of python-gnupg, including security patches, extensive documentation, and extra features. The gnupg module allows Python programs to make use of the functionality provided by the GNU Privacy Guard.'
url='https://github.com/isislovecruft/python-gnupg'
license=('GPL3')
arch=('any')
depends=('python' 'gnupg' 'python-psutil')
conflicts=('python-gnupg')
provides=('python-gnupg')
source=("https://github.com/isislovecruft/python-gnupg/archive/$pkgver.tar.gz")
sha256sums=('69b74379f235a370379d0c3f890102f5fdf0b0db580a728702abdfa4be5780ba')

build() {
  cd $name-$pkgver
  python setup.py build
}

package() {
  cd $name-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1
}
