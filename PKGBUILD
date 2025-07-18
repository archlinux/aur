# Maintainer: Edi Z <Penguin-Dev93@pm.me>
pkgname=remindmez
pkgver=1.0.0
pkgrel=1
pkgdesc="A fun CLI reminder tool with ASCII penguins and notifications"
arch=('any')
url="https://github.com/Penguin-Dev93/remindmez"
license=('MIT')
depends=('python' 'python-plyer' 'python-pyfiglet')
makedepends=('python-build' 'python-installer' 'python-wheel' 'git')
source=("$pkgname::git+https://github.com/Penguin-Dev93/remindmez.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
