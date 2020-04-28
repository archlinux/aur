# Contributor: mdraw.gh at gmail dot com
# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=httptools
_sha256sum=41b573cf33f64a8f8f3400d0a7faf48e1888582b6f6e02b82b9bd4f0bf7497ce

pkgname='python-httptools'
pkgver='0.1.1'
pkgrel=1
pkgdesc='A collection of framework independent HTTP protocol utils.'
arch=('x86_64')
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
