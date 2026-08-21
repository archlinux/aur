# Maintainer: Jose Olivio Pedrosa <root at rwx dot ovh>
pkgname=python-ite8291r3-ctl
pkgver=0.4
pkgrel=1
_name=${pkgname#python-}
pkgdesc="ite8291r3-ctl is a userspace driver for the ITE 8291 (rev 0.03) RGB keyboard backlight controller."
arch=(any)
url="https://github.com/pobrn/ite8291r3-ctl"
license=(GPL-2.0-only)
depends=(python  python-pyusb)
makedepends=(python-build python-installer python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('1ec403bbeb2d2d31a660cdd481dd58a3229c7321479f4200790b47646825e71c')

build() {
  cd "${srcdir}/${_name//-/_}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name//-/_}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
