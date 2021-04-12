# Maintainer: Tim Schumacher <timschumi@gmx.de>

pkgname=python-ytmusicapi
pkgver=0.15.1
pkgrel=2
pkgdesc="Unofficial API for YouTube Music."
arch=('any')
license=('MIT')
url="https://github.com/sigma67/ytmusicapi"
depends=('python-setuptools' 'python-requests')
source=("https://pypi.io/packages/source/y/ytmusicapi/ytmusicapi-$pkgver.tar.gz"
        "ytmusicapi-${pkgver}-LICENSE::https://raw.githubusercontent.com/sigma67/ytmusicapi/$pkgver/LICENSE")
sha512sums=('30011710fef294abafd84f1485cf74d49876746fd954bf31ab29ca1140679a999b8fe50987c1eb109d1606f04fce24f48a7e56542c51012171d881acfca32829'
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

