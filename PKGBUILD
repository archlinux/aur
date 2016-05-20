pkgname=abzer-git
pkgver=f2811a6
pkgrel=1
pkgdesc="AcousticBrainz submission tool"
arch=("any")
url="https://github.com/mineo/abzer"
license=('MIT')
source=('git+https://github.com/mineo/abzer')
md5sums=('SKIP')
depends=('python' 'python-aiohttp')
makedepends=('git')

pkgver(){
  cd "${srcdir}/abzer"
  echo "$(git describe --tags --always | sed 's/-/./g' )"
}

package() {
  cd "${srcdir}/abzer"
  python setup.py install --root="$pkgdir" --optimize=1
}
