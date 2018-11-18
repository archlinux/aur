# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=python-py-gfm
_pkgname=py-gfm
pkgver=0.1.4
pkgrel=1
pkgdesc="Github-Flavored Markdown for Python-Markdown"
url="https://github.com/Zopieux/py-gfm"
arch=(any)
license=('custom')
depends=('python' 'python-markdown')
makedepends=('python-setuptools')
source=("https://github.com/Zopieux/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('4730035b8a6168b6d2987a4a5f9a0ca70564e6797b7c88ec43f04152fa77c5a396f204b6143fc0bb3a53ab364b6d11b2274663b8b64d4640afba2a21cd1e3c6a')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
