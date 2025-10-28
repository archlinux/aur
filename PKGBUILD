# Maintainer: Archisman Panigrahi <apandada1ATgmail.com>
_pkgname=doi2bib3
pkgname=doi2bib3-git
pkgver=0.1.0
pkgrel=2
pkgdesc="Fetch BibTeX for DOIs or resolve arXiv ids to DOIs and fetch BibTeX"
arch=('any')
provides=('doi2bib3')
conflicts=('doi2bib3')
url="https://github.com/archisman-panigrahi/doi2bib3"
license=('GPL')
depends=('python' 'python-requests' 'python-bibtexparser')
makedepends=('python-pip' 'python-packaging' 'python-build' 'git')
source=("git+https://github.com/archisman-panigrahi/doi2bib3.git")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$_pkgname"
}

build() {
  cd "$srcdir/$_pkgname"
  python -m build --wheel
}

package() {
  cd "$srcdir/$_pkgname"
  python -m pip install --root="$pkgdir" --prefix=/usr --no-deps dist/*.whl

  # install README under the real package name
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

