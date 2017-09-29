pkgname=python-dkim
pkgver=0.6.2
_branch=${pkgver%.*}
pkgrel=1
pkgdesc="Python module that implements DKIM email signing and verification"
arch=('any')
url="https://launchpad.net/dkimpy"
license=('MIT')
depends=('python' 'python-dnspython')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://launchpad.net/dkimpy/${_branch}/${pkgver}/+download/dkimpy-${pkgver}.tar.gz")
sha512sums=('7592153270ea11f59dc67e31a10c91345389d4391f3a9dc9fbd1224410edab4743935763ad5b1016b321bfa7b1c4c0255f26323bd5556f359b0b743bda4e515b')

package() {
  cd "$srcdir/dkimpy-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
