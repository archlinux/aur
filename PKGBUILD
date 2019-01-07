# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=python-pkgconfig-1.1.0
pkgver=1.1.0
pkgrel=1
pkgdesc='Python module to interface with the pkg-config command line tool'
arch=(any)
url=https://github.com/matze/pkgconfig
license=(custom:MIT)
provides=('python-pkgconfig=1.1.0')
conflicts=(python-pkgconfig)
depends=(python)
makedepends=(python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/matze/pkgconfig/archive/v${pkgver}.tar.gz")
sha512sums=('82f2fc8ac7d74ccee7b4465c2c70c648ede96b036de08572ad6cfa3543dc18ae0593741580b23737ba7fe09d1e572b97c4703e3d8ac2b7256e11c3d79836e7c9')

package ()
{
  cd "pkgconfig-${pkgver}"
  
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
