# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kanban-tui
pkgver=0.22.0
pkgrel=1
pkgdesc="Kanban task manager with a TUI that agents can use"
arch=('any')
url="https://github.com/Zaloog/kanban-tui"
license=('MIT')
depends=('python' 'python-click' 'python-dateutil' 'python-pydantic' 'python-pydantic-settings' 'python-textual' 'python-textual-autocomplete' 'python-textual-jumper' 'python-textual-plotext' 'python-tomli-w' 'python-tzdata' 'python-xdg-base-dirs')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/k/kanban_tui/kanban_tui-${pkgver}.tar.gz")
sha256sums=('08a471539193df1bd92f17074e3c39781d22db75c3854770fe3504ca58e80f05')

build() {
  cd "kanban_tui-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "kanban_tui-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
