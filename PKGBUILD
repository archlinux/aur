pkgname=pyshamus
pkgver=0.6
pkgrel=5
pkgdesc="Clone of old DOS game SHAMUS"
arch=("any")
url="https://github.com/denix666/pyshamus"
license=("GPLv3")
makedepends=('python-setuptools')

source=("http://games.os.vc/pygames/pyshamus/pyshamus-${pkgver}-${pkgrel}.tar.gz"
        "pyshamus.png"
        "pyshamus.desktop"
)

package () {
    depends+=('python')
    
    cd "${srcdir}/${pkgname}"
    python setup.py install --root="${pkgdir}"
    
    cd "${srcdir}"
    install -D -m644 pyshamus.png ${pkgdir}/usr/share/pixmaps/pyshamus.png
    install -D -m644 pyshamus.desktop ${pkgdir}/usr/share/applications/pyshamus.desktop
}
sha256sums=('2d1fbb082c5fcd8e6a93cfe1741fc8a48f267f62e24fe90fa76abc6888918eaa'
            '57d5647b0d9d4e691a9abbec69e0794f227b181dc5b20fcef4b2299dfc52f41b'
            '561b7cf458e76cb6e581912ea5ef087e6adc4f45d90364a8c917e32c065bcd32')
