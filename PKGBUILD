# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')


pkgname=python-httpx-socks
_name="${pkgname#python-}"

pkgver=0.5.0
pkgrel=1

pkgdesc='HTTP/SOCKS-proxy transports for httpx'
arch=('any')
url="https://pypi.org/project/$_name"
license=('Apache')

makedepends=('python-setuptools')
depends=('python' 'python-httpx' 'python-python_socks')
optdepends=('python-async-timeout' 'python-trio' 'python-curio')

source=("$_name-$pkgver.tgz::https://github.com/romis2012/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5025c084114417267ab46a2108dde968618162df54e7c2e65ea3d595b5aee473')


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
