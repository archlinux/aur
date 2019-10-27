# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=devtools
pkgname="python-${_pkgname}"
pkgver=0.5.1
pkgrel=2
pkgdesc="Dev tools for python. The debug print command python never had (and other things)."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('LGPLv3')
depends=('python' 'python-pygments')
makedepends=('python-setuptools' 'python-pip')
source=("${_pkgname}-${pkgver}::https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('51ca8d2e15b8a862875a4837db2bafbc6cda409c069e960aec3f4bbd91fe9c08')

package() {
  cd "${_pkgname}-${pkgver}"

  pip install --prefix="${pkgdir}/usr" \
    -I --no-deps \
    --install-option="--optimize=2" \
    .[pygments]
}

