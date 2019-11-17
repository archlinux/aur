# Maintainer: Jokler <jokler.contact@gmail.com>

pkgname=campdown
pkgver=1.46
pkgrel=1
pkgdesc="Bandcamp track and album downloader"
arch=(any)
url="https://github.com/catlinman/campdown/"
provides=('campdown')
conflicts=('campdown' 'python-campdown')
replaces=('python-campdown')
license=(MIT)
depends=("python" "python-mutagen" "python-requests" "python-docopt")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/c6/cc/6be7de0c0250f97d186f5f58455161b2ae5bb96d6681b966f8a91ad2a31e/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e91e505368157319f660c615a2fffab757a414e025b5d6e6a69dc481952ad5b0')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
# vim: expandtab sw=2 ts=2
