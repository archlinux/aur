# Maintainer: Jokler <jokler.contact@gmail.com>

pkgname=campdown
pkgver=1.49
pkgrel=1
pkgdesc="Bandcamp track and album downloader"
arch=(any)
url="https://github.com/catlinman/campdown/"
replaces=("python-campdown")
license=(MIT)
depends=("python-mutagen" "python-requests" "python-docopt")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/catlinman/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("08b0271cc96431b4e1c20f6ab8cce21c48886d6e8212a5f9717ff84d2c3694d8")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
# vim: expandtab sw=2 ts=2
