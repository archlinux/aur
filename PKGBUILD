# Maintainer: gilbus <aur (AT) tinkershell dot eu>
pkgname=frogmouth
_name=frogmouth
pkgver=0.3.2
pkgrel=1
pkgdesc="A Markdown browser for your terminal "
arch=('any')
url="https://github.com/textualize/frogmouth"
license=('MIT')
depends=('python-textual' 'python-httpx' 'python-typing_extensions' 'python-xdg')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e1369d77c4c503e18bd503e9647d3ce9687556b7ef1cb5098ba47de601cee354')

prepare() {
  cd "$_name-$pkgver"
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

