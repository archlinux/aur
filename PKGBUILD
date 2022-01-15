pkgname=pypacman
pkgver=0.7
pkgrel=2
pkgdesc="Pacman game written in python"
arch=("any")
url="https://github.com/denix666/pypacman"
license=("GPLv3")
makedepends=('python-setuptools')

source=("http://games.os.vc/pygames/pypacman/pypacman-${pkgver}-${pkgrel}.tar.gz"
        "pypacman.png"
        "pypacman.desktop"
)

package () {
    depends+=('python')
    
    cd "${srcdir}/${pkgname}"
    python setup.py install --root="${pkgdir}"
    
    cd "${srcdir}"
    install -D -m644 pypacman.png ${pkgdir}/usr/share/pixmaps/pypacman.png
    install -D -m644 pypacman.desktop ${pkgdir}/usr/share/applications/pypacman.desktop
}
sha256sums=('d67587875688afa2c8479a06d862654e32a84033a45d83648a6d98479ff6645f'
            'd50307af7d53accc2f6150cd09b55216d5414ecb974ee3f57dfcb9d4eefa6767'
            '621b12e3691b5374cbd1b1535fa8826d6371be5ef2c9fc8c9a5afb74b978c860')
