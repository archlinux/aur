# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=contexter
pkgname=python-contexter
pkgver=0.1.4
pkgrel=1
pkgdesc='Full replacement of the contextlib standard library module'
arch=('any')
url=https://bitbucket.org/defnull/contexter
license=('MIT')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        'https://bitbucket.org/defnull/contexter/raw/37184b02cfa457a2541f27ca32241ea4c75a82bc/LICENSE.txt')
sha512sums=('85f6d0bf164bec4def05ba99a4759f1d0e0095b61015a8c429e2c249beb1407aef0294d259929043eda88f0c92dc7743fff91eda15d10700aa67a1bb117782db'
            '8a4e46959d7522a993d636421d7fde1ffef5b4ba92ac86dd6b38cd707fed871761e18fee9e45281ddbfb39332593ee7a882291c8a5db1a714d3fb4d37bebed10')

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 ../LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
