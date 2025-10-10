# Maintainer: Astro Angelfish <astro_angelfish at qq dot com>

_name=modelscope
pkgname=python-$_name
pkgver=1.30.0
pkgrel=1
pkgdesc='ModelScope: bring the notion of Model-as-a-Service to life.'
arch=('any')
groups=()
url='https://www.modelscope.cn/'
license=('Apache')
depends=('python' 'python-filelock' 'python-requests>=2.25' 'python-setuptools' 'python-tqdm>=4.64.0' 'python-urllib3>=1.26')
makedepends=('python-pip')
# It seems that .tar.gz source cannot be easily built, so we're heading the .whl file
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha512sums=('c515a5ae0b60d5c7a6658780c3516498226430c4c299e47afb7966a45f3b173c289b1b9ad31961912ba1aa3a7bad3f7955b2f5aeb52a369628a81c457595de0c')

package() {
  pip install \
    --verbose \
    --disable-pip-version-check \
    --no-warn-script-location \
    --ignore-installed \
    --no-compile \
    --no-deps \
    --root="$pkgdir" \
    --prefix=/usr \
    *.whl
}

