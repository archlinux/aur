# Maintainer: Archisman Panigrahi <apandada1ATgmail.com>

pkgname=doi2bib3-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Fetch BibTeX for DOIs or resolve arXiv ids to DOIs and fetch BibTeX"
arch=('any')
provides=('doi2bib3')
url="https://github.com/archisman-panigrahi/python-doi2bib3"
license=('GPL')
depends=('python' 'python-requests')
makedepends=('python-pip' 'python-build' 'git')
source=("git+https://github.com/archisman-panigrahi/python-doi2bib3.git")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
}

build() {
  cd "$srcdir/$pkgname"
  # build a wheel (optional, requires python-build)
  python -m build --no-isolation --wheel
}

package() {
  cd "$srcdir/$pkgname"
  # install package into the package root
  python -m pip install --root="$pkgdir" --prefix=/usr --no-deps .
  # install README
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}