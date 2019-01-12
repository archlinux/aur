# Maintainer: Jokler <jokler.contact@gmail.com>

pkgname=python-campdown
_pyname=campdown
pkgver=1.40
pkgrel=1
pkgdesc="Bandcamp track and album downloader"
arch=(any)
url="https://github.com/catlinman/campdown/"
license=(MIT)
depends=("python" "python-mutagen" "python-requests" "python-docopt")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/ba/76/4b110c02aa0f907d2cf514319670e49a4b981d9ce945aba47013c4b12c92/${_pyname}-${pkgver}.tar.gz")
sha256sums=('e168c0957621de2d0ef37123f6acb09bb1de30fed8a382ac4b0e2606b9ce9b2f')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
  # TODO Add this on the next release
  # install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
# vim: expandtab sw=2 ts=2
