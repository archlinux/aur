# Maintainer: Astro Angelfish <astro_angelfish at qq dot com>

_name=modelscope
pkgname=python-$_name
pkgver=1.36.0
pkgrel=2
pkgdesc='ModelScope: bring the notion of Model-as-a-Service to life.'
arch=('any')
groups=()
url='https://www.modelscope.cn/'
license=('Apache')
depends=('python' 'python-filelock' 'python-requests>=2.25' 'python-setuptools' 'python-tqdm>=4.64.0' 'python-urllib3>=1.26')
makedepends=('python-pip')
source=("git+https://github.com/modelscope/modelscope.git#tag=v${pkgver}")
sha512sums=('SKIP')

package() {
  cd "${srcdir}/modelscope"
  make whl
  pip install \
    --verbose \
    --disable-pip-version-check \
    --no-warn-script-location \
    --ignore-installed \
    --no-compile \
    --no-deps \
    --root="$pkgdir" \
    --prefix=/usr \
    package/dist/*.whl
}

