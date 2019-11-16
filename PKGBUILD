# Contributor: mdraw.gh at gmail dot com
# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=httptools
_sha256sum=e00cbd7ba01ff748e494248183abc6e153f49181169d8a3d41bb49132ca01dfc

pkgname='python-httptools'
pkgver='0.0.13'
pkgrel=2
pkgdesc='A collection of framework independent HTTP protocol utils.'
arch=('i686' 'x86_64')
url='https://github.com/MagicStack/httptools'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=(
  "https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=(
  "${_sha256sum}"
)

package() {
  cd "${srcdir}/httptools-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
