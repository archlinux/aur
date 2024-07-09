# Contributor: peeweep <peeweep at 0x0 dot ee>

pkgname=analyzemft-git
_pkgname=analyzeMFT
pkgver=20240501.b6ed04f
pkgrel=1
pkgdesc='Fully parse the MFT file from an NTFS filesystem'
arch=('any')
url="https://github.com/dkovar/analyzeMFT"
license=('CPL')
depends=('python')
makedepends=('git' 'python-setuptools')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
