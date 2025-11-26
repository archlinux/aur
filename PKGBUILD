# Contributor: bipin kumar <kbipinkumar _at_ pm.me>

pkgname=python-fastalite
_name=fastalite
pkgver=0.4.1
pkgrel=0
pkgdesc='lightweight Python library designed for simple parsing and manipulation of FASTA/FASTQ sequence files'
arch=('any')
url="https://github.com/nhoffman/fastalite"
license=('MIT')
depends=('python')
makedepends=(
  'python-setuptools'
  'python-wheel'
  'python-sphinx'
  'git'
)
options=(!emptydirs)
source=("${_name}::git+https://github.com/nhoffman/fastalite.git#tag=${pkgver}")
b2sums=('2aed3ad88b77dab4bd225a5b7c6bc21174ce7546a4133a09ee0625f0e936d06b9b92a3ab7b495a9044285ac2ded858dfff937ac88de4d2fbf1006d2f9282f01a')

build() {
  cd "$srcdir/$_name"
  python setup.py build
}

package() {
  cd "$srcdir/$_name"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 "$srcdir/$_name/LICENSE.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
}
