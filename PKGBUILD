# Maintainer: buckket <buckket@cock.li>

pkgname=twtxt
pkgver=1.2.3
pkgrel=1
pkgdesc="Decentralised, minimalist microblogging service for hackers."
arch=("any")
license=("MIT")
url="https://github.com/buckket/twtxt"
depends=("python-dateutil" "python-aiohttp" "python-click" "python-humanize")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/t/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('be1195b46c32804f4f5f4fc552da678f6c822c6604c54d9d09348613d687be12')

build() {
  cd ${pkgname}-${pkgver}
  python3 setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python3 setup.py install --root="${pkgdir}" --optimize=1
}

