# Maintainer: Sergey Safonov <spoof-arch@spoofa.info>
pkgname=jefferson
pkgver=0.4.1
pkgrel=1
pkgdesc="JFFS2 filesystem extraction tool"
url="https://github.com/sviehb/jefferson"
arch=(any)
license=(MIT)
depends=(python-{cstruct,lzo})
makedepends=(python-setuptools)
provides=(${pkgname})
conflicts=("${pkgname}-git")
source=("https://github.com/sviehb/jefferson/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('23e7b5efcc868e2aad946cbe8b73dc84c0e22fff5d9aa7e1060d9debfd1b7f17b98248714e55beb35a1215cb3a7c360e5ef473ce2c7ee9866d4a88749112b07f')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
