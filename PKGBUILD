# Maintainer: epitron <chris@ill-logic.com>
pkgname="gitless"
pkgver=0.8.4
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
  ecde4887eb20109a0345a1bfee420140522f981deff335d552908a00952853c8
  8837f140b111caf2c1a8bbb589c83ae5801a6bca8977ccdafc6de40dfe7700fe
)

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  # patch -p1 < ${srcdir}/versionless-deps.patch
  python setup.py install --root=${pkgdir} --optimize=1
}
