# Maintainer: Henry-Joseph Audéoud <h.audeoud@gmail.com>
pkgname=walt-common
pkgver=5
pkgrel=1
pkgdesc="WalT common python modules"
arch=(any)
url="https://walt-project.liglab.fr"
license=('BSD')
depends=(python-plumbum)
source=("https://files.pythonhosted.org/packages/source/w/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "LICENSE")
sha256sums=('90057f04079ad0339621c95e75e9e7204646820e5eb3eafa5b7894d9fb3b7d6b'
            '49e4de7e7679bb97dd8bf5363c87da852ef1e00d8a1263d2fe4855d7b47fd401')

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd "$pkgname-$pkgver"
    python setup.py install --root "$pkgdir" --optimize=1
}
