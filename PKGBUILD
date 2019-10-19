# Maintainer: Mohammad Hossein Sekhavat <sekhavat17@gmail.com>
# Original Maintainer: Ista Zahn <istazahn[at]gmail[dot]com>

pkgbase=python-altair3
_pyname=altair
pkgname=('python-altair3')
depends=('python' 'python-entrypoints' 'python-jsonschema' 'python-numpy' 'python-pandas' 'python-six' 'python-toolz')
conflicts=('python-altair')
replaces=('python-altair')
makedepends=('python-setuptools')
optdepends=('python-selenium: png and svg export support')
pkgver=3.2.0
pkgrel=2
pkgdesc=" Declarative statistical visualization library for Python"
arch=('any')
url="https://altair-viz.github.io/"
license=('MIT')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/altair-viz/altair/archive/v${pkgver}.tar.gz")
sha256sums=('2c52a31621836e42587fe4a2b5c0adec874d84597cfea102ceea0646700c95a8')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"

}

# vim:set et sw=2 ts=2 tw=79:
