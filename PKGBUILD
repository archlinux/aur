# Maintainer: Tpaefawzen <GitHub: Tpaefawzen>
# Contributer: Hugo Osvaldo Barrera <hugo@whynothugo.nl>

pkgname=lsplug
pkgver=4
pkgrel=2
pkgdesc="Nicer version of lsusb"
arch=('any')
url="https://git.sr.ht/~martijnbraam/lsplug"
license=('custom:MIT')
depends=('python' 'hwdata')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://git.sr.ht/~martijnbraam/lsplug/archive/${pkgver}.tar.gz")
sha512sums=('d88472005ee4f42ef5c6f9a457fb202598625ec2c0b3fb633e80f901edf82456d93131a6628203fb843ae162a2113c3c6bc3654c1d3b0ff34736e0893363089c')

_dir="${pkgname}-${pkgver}"

build() {
cd $_dir

  python -m build --wheel --no-isolation
}

package() {
cd $_dir

  python -m installer --destdir="$pkgdir" dist/*.whl

  # License file
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
