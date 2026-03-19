pkgname=suisave
pkgver=0.3.1
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

source=("https://files.pythonhosted.org/packages/8f/66/bcd30636644f446bcdd57da822e6d673f9670b65063cac60612896c7526c/suisave-$pkgver.tar.gz")

sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
