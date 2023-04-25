# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-async-tkinter-loop
_name=async_tkinter_loop
pkgver=0.8.1
pkgrel=1
pkgdesc="Asynchronous mainloop implementation for tkinter."
arch=('any')
url="https://github.com/insolor/async-tkinter-loop"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('fbd02f9d821931609ba4210a75b21a77253cce0c94956fdf4586320cec40cde8')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
