# Maintainer: VotreNom <votre.email@domaine.tld>
pkgname=python-pymatgen
pkgver=2025.7.8
pkgrel=1
pkgdesc="Python Materials Genomics - bibliothèque Python open source pour l’analyse des matériaux"
arch=('any')
url="https://github.com/materialsproject/pymatgen"
license=('MIT')
depends=('python' 'python-numpy' 'python-scipy' 'python-pandas' 'python-matplotlib' 'python-requests')
makedepends=('python-setuptools' 'git')
source=("$pkgname::git+https://github.com/materialsproject/pymatgen.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
