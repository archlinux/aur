# Maintainer: Hans-Nikolai Viessmann (hv15 AT hw.ac.uk)
_pkgname=vsc-base
pkgname="python2-${_pkgname}"
pkgver=2.5.8
pkgrel=2
pkgdesc="Basic Python libraries used by UGent's HPC group"
arch=('any')
url="https://github.com/hpcugent/vsc-base"
license=('LGPL')
depends=('python2' 'python2-vsc-install')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('57f3f49eab7aa15a96be76e6c89a72d8')

prepare() {
  cd "${_pkgname}-$pkgver"

  # for compatability with other packages
  # TODO this can be done more smartly, maybe?
  rm bin/optcomplete.bash
}

package() {
  cd "${_pkgname}-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

