# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')


pkgname=python-httpx-socks
_name="${pkgname#python-}"

epoch=1
pkgver=0.7.2
pkgrel=1

pkgdesc='HTTP/SOCKS-proxy transports for httpx'
arch=('any')
url="https://pypi.org/project/$_name"
license=('Apache')

makedepends=('python-setuptools')
depends=('python' 'python-python-socks' 'python-httpcore>=0.14' 'python-httpx>=0.21' 'python-httpx<0.22')
optdepends=('python-async-timeout' 'python-trio' 'python-curio')

source=("$_name-$pkgver.tgz::https://github.com/romis2012/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4408e916638b014e937f16cd096741c731f8b1cb74eff5305c0ca303f419039d')


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
