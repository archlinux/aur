pkgname=suisave
pkgver=0.3.0
pkgrel=1
pkgdesc="Simple, declarative backup tool"
arch=('any')
url="https://github.com/leogabac/suisave"
license=('MIT')
depends=(
  'python'
  'python-psutil'
  'python-rich'
  'python-tomlkit'
  'python-questionary'
  'python-desktop-notifier'
  'rsync'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)

source=("https://files.pythonhosted.org/packages/5e/5d/9d6d1e3f1c0aa3e524167e9ca3c7238d4d0cbff9a39a0addc213d9bd1666/suisave-$pkgver.tar.gz")

sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
