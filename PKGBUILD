# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-async-tkinter-loop
_name=async_tkinter_loop
pkgver=0.7.0
pkgrel=1
pkgdesc="Asynchronous mainloop implementation for tkinter."
arch=('any')
url="https://github.com/insolor/async-tkinter-loop"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d6b2df2d1e30ce3cfb237a9352d4142f05f680e3b31b0cf87f3581e421fec9eb')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
