# Maintainer: Henry-Joseph Audéoud <h.audeoud@gmail.com>
pkgname=walt-common
pkgver=8.2
pkgrel=1
pkgdesc="WalT common python modules"
arch=(any)
url="https://walt-project.liglab.fr"
license=('BSD')
depends=(python-plumbum python-pyyaml python-dateutil python-requests)
source=("https://files.pythonhosted.org/packages/source/w/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "LICENSE")
sha256sums=('0637817ec6fead8de3c4fd4790e77b5a4fe23ab0311d4d2f16f88a1f12ad4af7'
            '49e4de7e7679bb97dd8bf5363c87da852ef1e00d8a1263d2fe4855d7b47fd401')

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd "$pkgname-$pkgver" || exit
    python setup.py install --root "$pkgdir" --optimize=1
}
