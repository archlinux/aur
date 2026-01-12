# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Michael J. Pento <mjpento@verizon.net>
# Contributor: Thomas Weißschuh <thomas t-8ch.de>

pkgname=bump2version
pkgver=1.0.1
pkgrel=3
pkgdesc='Version-bump your software with a single command! (bumpversion community fork)'
provides=(bumpversion)
conflicts=(bumpversion)
arch=(any)
url="https://github.com/c4urself/$pkgname"
license=(MIT)
depends=(python-{build,installer,wheel}
         python-setuptools)
_archive="$pkgname-$pkgver"
source=("https://pypi.python.org/packages/source/b/$pkgname/$_archive.tar.gz")
sha256sums=('762cb2bfad61f4ec8e2bdf452c7c267416f8c70dd9ecb1653fd0bbb01fa936e6')

build() {
    cd "$_archive"
    python -m build -wn
}

package() {
    cd "$_archive"
    python -m installer -d "$pkgdir" dist/*whl
}
