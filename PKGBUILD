# Maintainer: Astro Angelfish <astro_angelfish at qq dot com>

_name=modelscope
pkgname=python-$_name
pkgver=1.31.0
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
sha512sums=('5b73e3f1bfa604aa349195ab276422703123b7eb80633e2eafd6301823154152ac0b88c3ba40c67a2d012d83c70c5d763cb1e0ad49f8639bea7ca0385e5515c2')

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

