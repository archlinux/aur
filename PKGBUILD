# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')


pkgname=python-httpx-socks
_name="${pkgname#python-}"

pkgver=0.5.1
pkgrel=1

pkgdesc='HTTP/SOCKS-proxy transports for httpx'
arch=('any')
url="https://pypi.org/project/$_name"
license=('Apache')

makedepends=('python-setuptools')
depends=('python' 'python-httpx' 'python-python_socks')
optdepends=('python-async-timeout' 'python-trio' 'python-curio')

source=("$_name-$pkgver.tgz::https://github.com/romis2012/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7bb369adf9522b9a1a62e924bfceb3404f7823bfebd82a6b6d85f647a81ec16e')


build() {
  cd "$_name-$pkgver"
  PYTHONHASHSEED=0 python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --prefix=/usr --skip-build
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/$pkgname/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
