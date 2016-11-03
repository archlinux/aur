# Maintainer: Eugene Dvoretsky <radioxoma at gmail>

pkgname=xdxf2slob-git
pkgver=5.c69d4bb
pkgrel=1
pkgdesc="Aard 2 Dictionary: Tool to convert XDXF (visual) dictionaries to slob format"
url='https://github.com/itkach/xdxf2slob'
arch=('any')
license=('GPL3')
depends=('python' 'python-slob-git')
makedepends=('git' 'python-setuptools')
source=("$pkgname::git+https://github.com/itkach/xdxf2slob.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
