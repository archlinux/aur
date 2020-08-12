# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=warcio
pkgname=python-${_pkgname}
pkgver=1.7.4
pkgrel=1
pkgdesc='Streaming WARC (and ARC) IO library'
arch=('any')
url='https://github.com/webrecorder/warcio'
license=('APACHE')
depends=('python' 'python-six')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e1889dad9ecac654de5b0973247f335a55827b1b14a8203772d18c749143ea51')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.rst'
}

# vim: ts=2 sw=2 et:
