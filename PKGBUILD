pkgbase=('python-lemonsqueezer')
pkgname=('python-lemonsqueezer')
_module='lemonsqueezer'
pkgver='0.1.1'
pkgrel=1
pkgdesc="An fast and lightweight wrapper for lemonbar"
url="https://gitlab.com/michalis_pardalos/lemonsqueezer"
depends=('python' 'lemonbar')
makedepends=('python-setuptools')
optdepends=('acpi: For Battery module'
            'bspwm: For BSPWMDesktops module'
            'dbus: For MediaControls module')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/l/lemonsqueezer/lemonsqueezer-${pkgver}.tar.gz")
md5sums=('d267b2a5ebc0f4ea01bf866355299912')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
