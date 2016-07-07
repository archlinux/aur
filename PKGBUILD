pkgname=abzer-git
pkgver=0.1.r6.ddacffb
pkgrel=1
pkgdesc="AcousticBrainz submission tool"
arch=("any")
url="https://github.com/mineo/abzer"
license=('MIT')
source=('git+https://github.com/mineo/abzer')
md5sums=('SKIP')
depends=('essentia-acousticbrainz' 'python' 'python-aiohttp')
makedepends=('git')

pkgver(){
  cd "${srcdir}/abzer"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
  cd "${srcdir}/abzer"
  python setup.py install --root="$pkgdir" --optimize=1
}
