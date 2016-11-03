# Maintainer: Eugene Dvoretsky <radioxoma at gmail>

pkgname=python-slob-git
pkgver=49.d1ed71e
pkgrel=1
pkgdesc="Aard 2 Dictionary: Library and tool to work with Slob (sorted list of blobs) dictionary files"
url='https://github.com/itkach/slob'
arch=('any')
license=('GPL3')
depends=('python' 'python-pyicu')
makedepends=('git' 'python-setuptools')
source=("$pkgname::git+https://github.com/itkach/slob.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
