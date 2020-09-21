# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Ronuk Raval <ronuk.raval at gmail dot com>

_pkgname='webruntime'
pkgname="python-${_pkgname}"
pkgver=0.5.8
pkgrel=1
pkgdesc='Launch HTML5 apps in the browser or a desktop-like runtime.'
arch=('any')
url='https://github.com/flexxui/webruntime'
license=('BSD')
depends=('python'
        'python-dialite')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ee3692b8194a8fd4aec476dcad75f05c43b3766903f7e13d4e16c1f9c433a033')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
