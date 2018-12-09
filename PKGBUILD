pkgname=python-dkim
pkgver=0.9.0
_branch=${pkgver%.*}
pkgrel=2
pkgdesc="Python module that implements DKIM email signing and verification"
arch=('any')
url="https://launchpad.net/dkimpy"
license=('MIT')
depends=('python' 'python-dnspython')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://launchpad.net/dkimpy/${_branch}/${pkgver}/+download/dkimpy-${pkgver}.tar.gz")
sha512sums=('9e46e1942c3022b80d469679f1cae7bb83d012bf6778148d9b0d7031aec0711a9ba62582d1ce3e36995f0be6c3d7818608520fd10c798a867767993de511ef26')

package() {
  cd "$srcdir/dkimpy-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
