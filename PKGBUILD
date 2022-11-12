# Maintainer: buckket <buckket@cock.li>

pkgname=twtxt
pkgver=1.3.1
pkgrel=1
pkgdesc="Decentralised, minimalist microblogging service for hackers."
arch=("any")
license=("MIT")
url="https://github.com/buckket/twtxt"
depends=("python-dateutil" "python-aiohttp" "python-click" "python-humanize")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/t/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f15e580f8016071448b24048402b939b9e8dec07eabacd84b1f2878d751b71ff')

build() {
  cd ${pkgname}-${pkgver}
  python3 setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python3 setup.py install --root="${pkgdir}" --optimize=1
}

