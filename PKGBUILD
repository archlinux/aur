# Maintainer: Astro Angelfish <astro_angelfish at qq dot com>

_name=modelscope
pkgname=python-$_name
pkgver=1.33.0
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
sha512sums=('46c0fd56ce5924090468df6774ec6d8fe366e082cd04f22d40356aa7fbae1d26755f4e1ff79afed26197a11bd93d3cd59bdcac983516f02fe34c60b24986b508')

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

