# Maintainer:  JP-Ellis <josh@jpellis.me>
pkgname=python-habanero
_name=${pkgname#python-}
pkgver=1.2.3
pkgrel=1
pkgdesc="Habanero is a low level client for working with Crossref's search API."
arch=('any')
url="https://pypi.org/project/habanero/"
license=('GPL')
depends=(
  'python'
  'python-requests'
  'python-tqdm'
)
makedepends=('python-setuptools')
optdepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('196f9e01b42dad2cd829dc5d0bbe466232daf6ad5f1b0ee7098a57927b17e908')
noextract=()

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  touch Changelog.rst
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
