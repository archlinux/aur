# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pywerview-git
_pypiname=pywerview
#_pypidir="8b/ca/fc13415e41427f5bc925ccbe80361af2bdf4c6f21c9683e28c12d0703f72"
pkgver=r183.2fd83cf
pkgrel=1
pkgdesc="A (partial) Python rewriting of PowerSploit's PowerView.(Python3 fork)"
url="https://github.com/mpgn/pywerview"
conflicts=('python-pywerview')
provides=('python-pywerview')
arch=('any')
license=('GPLv3')
depends=('python' 'impacket' 'python-pyopenssl' 'python-pyasn1' 'python-pycryptodome'
'python-pyopenssl' 'python-beautifulsoup4')
makedepends=('python-setuptools')
source=("git+https://github.com/mpgn/pywerview.git")

sha256sums=('SKIP')

pkgver() {
  cd "${_pypiname}"
  # Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pypiname}"
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
