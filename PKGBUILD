# Maintainer: Jiri Pospisil <jiri@jpospisil.com>

pkgname=marcel
pkgver=0.22.2
pkgrel=1
pkgdesc='A modern shell'
url='https://github.com/geophile/marcel'
source=("https://github.com/geophile/marcel/archive/refs/tags/v$pkgver.tar.gz")
arch=('any')
depends=('python' 'python-dill' 'python-psutil')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
license=('GPL-3.0-only')
b2sums=('1280fa056b3e16347e260f8f7bcc60ae026295ceea3c14dc0da0bd3a99d79c97cc9df90d7be4c3e01f3c9bfcfc2c9c03cf17d677a12ffe7edd022e568d377334')

build() {
  cd marcel-"$pkgver"
  rm -rf 'test'
  python -m build --wheel --no-isolation
}

package() {
  cd marcel-"$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
