# Maintainer: Tim Schumacher <timschumi@gmx.de>

pkgname=python-ytmusicapi
pkgver=0.14.3
pkgrel=1
pkgdesc="Unofficial API for YouTube Music."
arch=('any')
license=('MIT')
url="https://github.com/sigma67/ytmusicapi"
depends=('python-setuptools' 'python-requests')
source=("https://pypi.io/packages/source/y/ytmusicapi/ytmusicapi-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/sigma67/ytmusicapi/$pkgver/LICENSE")
sha512sums=('23cf242f911a9d744fd3c88d46d0be3ac2e7e3257b436d80ebdf819461a0c333e748a4c3b699e234a4fddf92290c6c7e0848002d24ae36a6c0639a2b1cc74ed9'
            '205d1ad949dbce9cbd5a3631ba2a9f7a06117cb7745870fcb201ad649e6ef987c8c5f8d791a5509a15a0918b65d7af59ab6d502b1804ccfe2a3026f9f0004468')

build() {
  cd ytmusicapi-$pkgver
  python setup.py build
}

package() {
  cd ytmusicapi-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dvm644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 "$srcdir/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

