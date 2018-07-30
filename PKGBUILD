# Maintainer: Alex Brinister <alex_brinister -at- yahoo -dot- com>
# Contributor: Alex Brinister <alex_brinister -at- yahoo -dot- com>

pkgname=python-cheetah3
pkgver=3.1.0
pkgrel=1
pkgdesc="A Python 3-powered template engine and code generator"
arch=(x86_64)
url="http://www.cheetahtemplate.org"
license=(custom)
depends=(python)
makedepends=('python-setuptools' 'python-pygments' 'python-markdown')
provides=('cheetah3' 'python-cheetah3')
conflicts=('cheetah3' 'python-cheetah3')
source=("https://files.pythonhosted.org/packages/54/86/ea50bb5baf1daa8ca1a56774d48150a69376679d27c4130848702efc378c/Cheetah3-${pkgver}.tar.gz")
sha512sums=('879de1b7a333def757a1618b7c28348d8b2f43a433aa8d5d9ee501619a854c514ca4a842f741bf4d272f5cc2defa137b741d2cc9648a3fc40dc2c4ab50692fac')

build() {
  cd "${srcdir}/Cheetah3-${pkgver}"
  python setup.py build
}

package() {
  msg "Install..."
  cd "${srcdir}/Cheetah3-${pkgver}"
  python setup.py install --root="${pkgdir}" || return 1

  msg2 "Install copyright resources in /usr/share/licenses/${pkgname}..."
  install -Dm644 "${srcdir}/Cheetah3-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
