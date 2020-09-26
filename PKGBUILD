# Maintainer: Jokler <jokler.contact@gmail.com>

pkgname=campdown
pkgver=1.48
pkgrel=1
pkgdesc="Bandcamp track and album downloader"
arch=(any)
url="https://github.com/catlinman/campdown/"
replaces=("python-campdown")
license=(MIT)
depends=("python-mutagen" "python-requests" "python-docopt")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=("8bfad3d42bab05e0d7b3e9c68fe1e589d9fcd498d0d4d7711aa5fc4f9210c432")

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
