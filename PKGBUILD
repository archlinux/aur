# Maintainer: Matthew Geskey <vitrvvivs.architectus@gmail.com>

pkgname=python-yacker-git
pkgver=2019.1.r0.ge959885
pkgrel=1
pkgdesc="A YAML wrapper around Packer"
arch=('any')
url="https://gitlab.com/matilda.peak/yacker"
source=('git+https://gitlab.com/matilda.peak/yacker.git')
md5sums=('SKIP')
depends=('packer' 'python' 'python-pyaml')
makedepends=('python-setuptools')

_name=yacker

pkgver() {
  cd "$_name"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd "$srcdir/$_name"
  python setup.py build
}

package() {
  cd "$srcdir/$_name"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:

