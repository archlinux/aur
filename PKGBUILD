# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=claude-vault
pkgver=0.8.7
pkgrel=1
pkgdesc="Syncs Claude AI conversations and Claude Code history into searchable Markdown for Obsidian"
arch=('any')
url="https://github.com/MarioPadilla/claude-vault"
license=('AGPL-3.0-or-later')
depends=('python' 'python-typer' 'python-pydantic' 'python-frontmatter'
         'python-rich' 'python-requests' 'python-watchdog' 'python-numpy')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MarioPadilla/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('897da98a9b32f5924286aaa7d6dda9eab9612646b2ac4db4f9e63cb71a46f9ac')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
