# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgbase='ansible-lint-junit'
pkgname=('python-ansible-lint-junit' 'python2-ansible-lint-junit')
pkgver='0.9'
pkgrel='1'
pkgdesc='ansible-lint to JUnit converter'
arch=('any')
url="https://github.com/wasilak/${pkgbase}"
makedepends=('python' 'python-setuptools'
	     'python2' 'python2-setuptools')
license=('BSD')
source=("${url}/archive/${pkgver}.tar.gz"
	"ansible_lint_junit_0.9_python3.patch")
sha256sums=('5e49c4a15e6425fd5968f98d416f4917482c7fb6a871e7fb527edbd94b4b6a3b'
            'e700d5d3d048197db0a67638c735a78306a528d28477deb946897ac6206c26bf')

prepare() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  patch -p1 -i "${srcdir}/ansible_lint_junit_0.9_python3.patch"
}

package_python-ansible-lint-junit() {
  depends=('ansible-lint')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
}

package_python2-ansible-lint-junit() {
  depends=('ansible-lint')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}"
}
