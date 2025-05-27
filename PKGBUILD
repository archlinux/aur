# Maintainer: VCalV

_name=gradio_log
pkgname=python-gradio-log
pkgver=0.0.8
pkgrel=1
pkgdesc="A Log component for Gradio which can easily show some log file in the interface."
arch=('any')
url='https://github.com/louis-she/gradio-log'
license=('Apache-2.0')
depends=('python>=3.8' 'python-gradio>=4.0' 'python-gradio<6.0')
makedepends=(python-build python-installer python-wheel)
checkdepends=()
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha512sums=('8e253f29be2da88eeeb1fc048a571baf672e6c9d66a612d8f67f516a079ef10d27188c500b45ff8fa785a369545450e0e14045c4b6ed56b314d7ea30c70de28e')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

