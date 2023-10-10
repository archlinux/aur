# Maintainer: Caspar Friedrich <c.s.w.friedrich@gmail.com>

# Note: `makepkg --printsrcinfo > .SRCINFO`

pkgname="python-west"
_name=${pkgname##"python-"}
pkgdesc="Zephyr RTOS Project meta-tool"
pkgver=1.2.0
pkgrel=1
arch=("any")
url="https://pypi.org/project/west/"
license=("Apache")
depends=("python>=3.6"
         "python-wheel"
         "python-colorama"
         "python-yaml>=5.1"
         "python-pykwalify"
         "python-packaging")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

package() {
    cd $srcdir/$_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}

sha256sums=("b41e51ac90393944f9c01f7be27000d4b329615b7ed074fb0ef693b464681297")
