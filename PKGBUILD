# Maintainer: Josh VanderLinden <arch@cloudlery.com>
_base=logstash
pkgname=(
  python-${_base}
  python2-${_base}
)
pkgver=0.4.6
pkgrel=1
pkgdesc="Python logging handler for Logstash"
arch=('any')
url="https://github.com/vklochan/python-logstash"
license=('MIT')
source=("https://pypi.python.org/packages/source/p/python-${_base}/python-${_base}-${pkgver}.tar.gz")
md5sums=('26fafa0ea306025fb7644d70cb38982a')

_inst() {
  depends=("${1}" "${1}-setuptools")

  cd python-${_base}-${pkgver}/
  ${1} setup.py install --optimize 1 --root "${pkgdir}/"

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

package_python-logstash() {
  _inst python
}

package_python2-logstash() {
  _inst python2
}

# vim:set ts=2 sw=2 et:
