pkgname=python-ursina
pkgver=3.6.0
pkgrel=1
pkgdesc="An easy to use game engine/framework for python."
arch=("any")
url="https://pokepetter.github.io/ursina"
license=("MIT")
depends=("python-numpy"
                 "panda3d"
                 "python-pillow"
                 "python-screeninfo"
                 "python-pyperclip")
makedepends=("python-setuptools")
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/2f/60/57e2c4a2a064fcc4a1f4060991fb17c0bb17c63191d52de6dc2ea82ac8a0/ursina-3.6.0.tar.gz")
sha256sums=("f542b067d85719d6fe375bed09bda7cc7195c39d526e2be3f6368bbf9558813c")

package() {
    cd "ursina-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
