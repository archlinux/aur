# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')


pkgname=python-limiter
_name="${pkgname#python-}"

pkgver=0.1.2
pkgrel=1

pkgdesc='Rate-limiting thread-safe, async decorators/context-managers implementing token-bucket'
arch=('any')
url="https://pypi.org/projects/$_name"
license=('AGPL')

makedepends=('python-setuptools')
depends=('python' 'python-token-bucket')

#source=("$_name-$pkgver.tgz::https://github.com/alexdelorenzo/$_name/archive/refs/tags/v$pkgver.tar.gz")
source=("https://files.pythonhosted.org/packages/b2/e1/2aa236d8d3f257515604ab66e5a13a59ca1b27fce8412848f17750702e90/$_name-$pkgver.tar.gz")
sha256sums=('5608e4b6c0990b30a3477effe1fb48c969bf037963da689b946654944da4f997')


build() {
  cd "$_name-$pkgver"
  PYTHONHASHSEED=0 python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/$pkgname/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
