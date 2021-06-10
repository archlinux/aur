# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')


pkgname=python-httpx-socks
_name="${pkgname#python-}"

pkgver=0.4.1
pkgrel=1

pkgdesc='HTTP/SOCKS-proxy transports for httpx'
arch=('any')
url="https://pypi.org/project/$_name"
license=('Apache')

makedepends=('python-setuptools')
depends=('python' 'python-httpx' 'python-python_socks')
optdepends=('python-async-timeout' 'python-trio' 'python-curio')

source=("$_name-$pkgver.tgz::https://github.com/romis2012/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f6c24f6606865f89083e51799d69bd5e005739c9b9569a9a0653e86f8ec1be9d')


build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --prefix=/usr --skip-build
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/$pkgname/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
