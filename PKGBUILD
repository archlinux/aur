pkgname=python-dkim
pkgver=0.6.1
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
sha512sums=('c65a790e3e645fe0a18f267766639f23b19704034d8487aae0165b77d1cec420f1d53be472eb92730e3aa41e03f0660ec57791e74143c6a8901fbffa790737f6')

package() {
  cd "$srcdir/dkimpy-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
