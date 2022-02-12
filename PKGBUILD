# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')


pkgname=python-limiter
_name="${pkgname#python-}"

pkgver=0.3.1
pkgrel=1

pkgdesc='Rate-limiting thread-safe, async decorators/context-managers implementing token-bucket'
arch=('any')
url="https://pypi.org/projects/$_name"
license=('AGPL')

makedepends=('python-setuptools')
depends=('python' 'python-token-bucket' 'python-strenum')

source=("$_name-$pkgver.tgz::https://github.com/alexdelorenzo/$_name/archive/refs/tags/v$pkgver.tar.gz")
#source=("https://files.pythonhosted.org/packages/b2/e1/2aa236d8d3f257515604ab66e5a13a59ca1b27fce8412848f17750702e90/$_name-$pkgver.tar.gz")
sha256sums=('0c999b2342a7d6d4bf27283d2a6e9fb39881b77be55e8da3ccbe2d7088a2432e')


build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --skip-build --optimize=1
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/$pkgname/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
