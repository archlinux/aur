# Maintainer: Michael x30827pos@gmail.com
# Description: Convert Git repository contents to Markdown format
# Source URL: https://github.com/xpos587/git2md

pkgname=python-git2md
pkgver=1.1.4
pkgrel=1
pkgdesc="Convert Git repository contents to Markdown format"
arch=('any')
url="https://github.com/xpos587/git2md"
license=('MIT')
depends=('python' 'python-setuptools' 'python-pathspec')
makedepends=('python' 'python-setuptools')
source=("https://github.com/xpos587/git2md/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/git2md-$pkgver"
  # If you need to run any preparation steps (e.g. patching) here, you can do it
}

build() {
  cd "$srcdir/git2md-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/git2md-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

# Optionally, you can add testing steps if needed
check() {
  cd "$srcdir/git2md-$pkgver"
  python setup.py test
}

# Optional: If you want to include any extra information like documentation
doc() {
  install -Dm644 "$srcdir/git2md-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
