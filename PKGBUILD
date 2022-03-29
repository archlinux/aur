# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: epitron <chris@ill-logic.com>

pkgname=gitless
pkgver=0.9.17
pkgrel=2
pkgdesc='A scientifically proven easier-to-use git interface'
arch=('any')
url="https://github.com/goldstar611/gitless"
license=('MIT')
depends=('python' 'git' 'python-pygit2' 'python-argcomplete')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
_archive="$pkgname-$pkgver"
source=("https://github.com/goldstar611/gitless/archive/$pkgver/$_archive.tar.gz")
sha256sums=('c084b561fe09543b816ca2bba25e02e2df78a4444c9cbb9acec59a7f073c2910')

build() {
   cd "$_archive"
   python -m build -wn
}

package() {
   cd "$_archive"
   python -m installer -d "$pkgdir" dist/*.whl
   install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
}
