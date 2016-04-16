# Maintainer: buckket <buckket@cock.li>

pkgname=twtxt
pkgver=1.2.1
pkgrel=2
pkgdesc="Decentralised, minimalist microblogging service for hackers."
arch=("any")
license=("MIT")
url="https://github.com/buckket/twtxt"
depends=("python-dateutil" "python-aiohttp" "python-click" "python-humanize")
makedepends=("python-setuptools")
source=("https://pypi.python.org/packages/source/t/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("b6c892655f2fb7efd183410a0071830a1df70185d3ac6bf657afeb812a5cacb4")

build() {
  cd ${pkgname}-${pkgver}
  python3 setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python3 setup.py install --root="${pkgdir}" --optimize=1
}

