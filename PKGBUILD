# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_pkgname=FileTeaSend
pkgname=fileteasend
pkgver=1.0
pkgrel=1
pkgdesc='Easy file transfer using the FileTea service'
arch=('any')
url='https://github.com/brechin/FileTeaSend'
license=('GPLv3')
depends=('python-requests' 'python-magic')
makedepends=('python-setuptools')
source=("https://github.com/brechin/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8d1c61b81ced3730fca7db6cb90d5f81f6db90b568d55c802f481afb78689d91')

prepare() {
  cd "${_pkgname}-${pkgver}"
  sed '/python-magic/d' -i setup.py
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize='1'
  # doc files
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -D -m644 CONTRIBUTORS.md "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTORS.md"
}
