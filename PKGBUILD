pkgname=python-ursina
pkgver=5.2.0
pkgrel=1
pkgdesc="An easy to use game engine/framework for python."
arch=("any")
url="https://pokepetter.github.io/ursina"
license=("MIT")
depends=("python"
                 "python-numpy"
                 "panda3d"
                 "python-pillow"
                 "python-screeninfo"
                 "python-pyperclip")
makedepends=("python-setuptools")
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/1c/ae/767f11bdee8a1ed6e755c4f7805caa73d76468963669e1891e02f2e138c4/ursina-5.2.0.tar.gz")
sha256sums=("090fc35858c5fc64bf898fd0d9449d43552b405b696088a0247c10ac643f581e")

package() {
    cd "ursina-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
