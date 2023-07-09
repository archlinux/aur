# Maintainer: Matt Cuneo <m@cuneo.au>
_pkgname=lemmony
pkgname="python-$_pkgname"
pkgver=0.0.5
pkgrel=1
pkgdesc="A better 'All' browsing experience for Lemmy instances"
arch=('any')
url="https://github.com/jheidecker/$_pkgname"
license=('MIT')
depends=('python-certifi' 'python-charset-normalizer' 'python-idna' 'python-requests' 'python-urllib3')
makedepends=(python-build python-installer)
source=("https://github.com/jheidecker/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d4b134464039c95c6b61ce6f3d5e877c045c6207bad40662e9749874b3294cc9')

build() {
  cd $_pkgname-$pkgver
  python -m build
}
package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
