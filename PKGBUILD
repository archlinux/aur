# Maintainer: Henry-Joseph Audéoud <h.audeoud@gmail.com>
pkgname=walt-common
pkgver=6
pkgrel=1
pkgdesc="WalT common python modules"
arch=(any)
url="https://walt-project.liglab.fr"
license=('BSD')
depends=(python-plumbum)
source=("https://files.pythonhosted.org/packages/source/w/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "LICENSE")
sha256sums=('4a79509b58d918826f743b8f41c624c388bf866ebc2f142aee0651c89d2360fb'
            '49e4de7e7679bb97dd8bf5363c87da852ef1e00d8a1263d2fe4855d7b47fd401')

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd "$pkgname-$pkgver" || exit
    python setup.py install --root "$pkgdir" --optimize=1
}
