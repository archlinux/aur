# Maintainer: Tim Schumacher <timschumi@gmx.de>

pkgname=python-ytmusicapi
pkgver=0.17.1
pkgrel=1
pkgdesc="Unofficial API for YouTube Music."
arch=('any')
license=('MIT')
url="https://github.com/sigma67/ytmusicapi"
depends=('python-setuptools' 'python-requests')
source=("https://pypi.io/packages/source/y/ytmusicapi/ytmusicapi-$pkgver.tar.gz"
        "ytmusicapi-${pkgver}-LICENSE::https://raw.githubusercontent.com/sigma67/ytmusicapi/$pkgver/LICENSE")
sha512sums=('a88376b704c4cb447936b6e74d45a5cadbd72f279a064ae44c187ba31e104c893fe4fe51a8e1d7e686ef296c8e1a9141c3f43322e1802348dbeed88c89e95d39'
            '205d1ad949dbce9cbd5a3631ba2a9f7a06117cb7745870fcb201ad649e6ef987c8c5f8d791a5509a15a0918b65d7af59ab6d502b1804ccfe2a3026f9f0004468')

build() {
  cd ytmusicapi-$pkgver
  python setup.py build
}

package() {
  cd ytmusicapi-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dvm644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 "$srcdir/ytmusicapi-${pkgver}-LICENSE" -T "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

