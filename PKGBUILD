# Maintainer: epitron <chris@ill-logic.com>
pkgname="gitless"
pkgver=0.8.3
pkgrel=1
pkgdesc="A scientifically proven easier-to-use git interface"
arch=("any")
url="http://gitless.com/"
license=("GPL")
depends=("python" "git" "python-sh" "python-clint" "python-pygit2")
source=(
  "https://github.com/sdg-mit/gitless/archive/v$pkgver.tar.gz"
  "versionless-deps.patch"
)
sha256sums=(
  df212d6a3d377f90c46d03fd4216ecbbeb40055b62c0fe73b9c3aa165ea8f0af
  e91c08b027a183d0ccf46c46f26c8d5e846dcd1f96276067e46d509b3418fbf8
)

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -p1 < ../../versionless-deps.patch
  python setup.py install --root=${pkgdir} --optimize=1
}
