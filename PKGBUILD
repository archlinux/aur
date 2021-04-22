# Maintainer: Tim Schumacher <timschumi@gmx.de>

pkgname=python-ytmusicapi
pkgver=0.16.0
pkgrel=1
pkgdesc="Unofficial API for YouTube Music."
arch=('any')
license=('MIT')
url="https://github.com/sigma67/ytmusicapi"
depends=('python-setuptools' 'python-requests')
source=("https://pypi.io/packages/source/y/ytmusicapi/ytmusicapi-$pkgver.tar.gz"
        "ytmusicapi-${pkgver}-LICENSE::https://raw.githubusercontent.com/sigma67/ytmusicapi/$pkgver/LICENSE")
sha512sums=('ce5c14836cc4a804e96bcfea42c32bde5c0fd5e3589351a3de23298340ae08b60aa09020aa7fe9a4ce422f0b414881e17c6101aa617787b3cba34f49e6d94023'
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

