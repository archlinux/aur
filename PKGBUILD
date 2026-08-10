# Maintainer: Astro Angelfish <astro_angelfish at qq dot com>

_name=modelscope-hub
pkgname=python-$_name
pkgver=0.2.0
pkgrel=1
pkgdesc='The official Python client to connect with ModelScope Hub.'
arch=('any')
groups=()
url='https://www.modelscope.cn/'
license=('Apache')
depends=('python' 'python-filelock' 'python-requests>=2.28' 'python-setuptools' 'python-tqdm>=4.64.0' 'python-urllib3>=1.26')
makedepends=('python-pip')
source=("git+https://github.com/modelscope/modelscope_hub.git#tag=v${pkgver}")
sha512sums=('SKIP')

package() {
  cd "${srcdir}/modelscope_hub"
  make build
  pip install \
    --verbose \
    --disable-pip-version-check \
    --no-warn-script-location \
    --ignore-installed \
    --no-compile \
    --no-deps \
    --root="$pkgdir" \
    --prefix=/usr \
    dist/*.whl
}

