# Maintainer: Tim Schumacher <timschumi@gmx.de>

pkgname=python-ytmusicapi
pkgver=0.13.1
pkgrel=1
pkgdesc="Unofficial API for YouTube Music."
arch=('any')
license=('MIT')
url="https://github.com/sigma67/ytmusicapi"
depends=('python-setuptools' 'python-requests')
source=("https://pypi.io/packages/source/y/ytmusicapi/ytmusicapi-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/sigma67/ytmusicapi/$pkgver/LICENSE")
sha512sums=('e1ac79fb1b4882a3784335218ea41bdf87f54c709268a2898e71966a7679e7fae6556b15c4d5873ecbd6dbb7f62d4b144e8630a6b50a6e2d5978975cf5a1b619'
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

