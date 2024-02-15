# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=unidump-git
_pkgname=unidump
pkgver=v1.1.3.r0.g0626d6c
pkgrel=1
pkgdesc='hexdump for Unicode data.'
arch=('any')
url='https://github.com/Codepoints/unidump'
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'git')
conflicts=('unidump')
source=("git+https://github.com/Codepoints/$_pkgname.git")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname

  python setup.py build
}

package() {
  cd $_pkgname

  python setup.py install --root="$pkgdir" --prefix=/usr -O1 --skip-build
}
