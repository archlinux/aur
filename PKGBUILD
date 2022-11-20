# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Atlanis <emallson@archlinux.us>

pkgname=python38-oauth2client
pkgver=4.1.3
pkgrel=8
pkgdesc="A client library for OAuth 2.0"
arch=('any')
url="https://github.com/google/oauth2client"
license=('Apache')
depends=('python38-httplib2' 'python38-pyasn1' 'python38-pyasn1-modules' 'python38-rsa' 'python38-six')
optdepends=('python38-gflags: for oauth2client.tools.run function')
makedepends=('python38-setuptools')
source=("https://github.com/google/oauth2client/archive/v${pkgver}.tar.gz")
sha256sums=('65a05310e3f16b930454aed7bed619edca8025ba96324c3e9b57dd508f1a014f')

build() {
  cd "$srcdir"/oauth2client-${pkgver}
  python3.8 setup.py build
}

package() {
  cd "$srcdir"/oauth2client-${pkgver}

  python3.8 setup.py install --skip-build --root="$pkgdir" --optimize=1
}
