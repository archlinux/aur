# Maintainer: Astro Angelfish <astro_angelfish at qq dot com>

_name=modelscope
pkgname=python-$_name
pkgver=1.32.0
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
sha512sums=('0914c13532522f6c7c712a5ea88e3f47599d2f3b4137379cbe76e07d3d56bd2225a7988cd9b5eb8896e563a22cfd14fd5cb05c0a83aaf65314291ac8b3334609')

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

