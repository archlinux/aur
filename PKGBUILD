pkgname=python-ursina
pkgver=4.0.0
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
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/ef/1b/19c7fe203c3483e1e21cf640bf0cb45fcad235868547103c3e783bbdcf29/ursina-4.0.0.tar.gz")
sha256sums=("c49c7bf52b3deaa909fe7412219692ce0bc57841b8e681ad4cb95377f33cb26a")

package() {
    cd "ursina-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
