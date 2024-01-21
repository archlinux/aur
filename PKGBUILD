# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-markdown-del-ins
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=1
pkgdesc="Markdown extension to support the <del> and <ins> tags"
arch=('any')
url="https://github.com/honzajavorek/markdown-del-ins"
license=('BSD-3-Clause')
depends=('python' 'python-markdown')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('501d1a6b6d9eb9f738ed5d12727f6e01df2082d89f854c94f44224d0fd68cfd2')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
