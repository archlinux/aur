# Maintainer: epitron <chris@ill-logic.com>
pkgname="gitless"
pkgver=0.8.6
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
  e1d009bf9d7c89428d7029394cc85a0d91bd2af73f019508ddc92c98faeed8e5
  8837f140b111caf2c1a8bbb589c83ae5801a6bca8977ccdafc6de40dfe7700fe
)

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  # patch -p1 < ${srcdir}/versionless-deps.patch
  python setup.py install --root=${pkgdir} --optimize=1
}
