# Maintainer: Jokler <jokler.contact@gmail.com>

pkgname=campdown
pkgver=1.46
pkgrel=1
pkgdesc="Bandcamp track and album downloader"
arch=(any)
url="https://github.com/catlinman/campdown/"
replaces=("python-campdown")
license=(MIT)
depends=("python" "python-mutagen" "python-requests" "python-docopt")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=("e91e505368157319f660c615a2fffab757a414e025b5d6e6a69dc481952ad5b0")

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
