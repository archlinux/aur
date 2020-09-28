# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=devtools
pkgname="python-${_pkgname}"
pkgver=0.6
pkgrel=1
pkgdesc="Dev tools for python. The debug print command python never had (and other things)."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('LGPL3')
depends=('python' 'python-pygments')
makedepends=('python-setuptools' 'python-pip')
source=("${_pkgname}-${pkgver}::https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('3f2d4eb2de2a8501c41330524414b495d7bbf3066384b3cec5fa784a0d07099b')
b2sums=('e2cfdfdd8c52204df8c6bcebe99a200aec57bba9c0cb36f44a5e38993f928a49ce89ff0e59101a3781918a6fb4be9decf27edf59ddf4e98c5eb44674a9294fe1')

build() {
  cd "${_pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
