pkgname=screenplain
pkgver=0.9.0
pkgrel=1
pkgdesc='Fountain parser with FDX, HTML and PDF backends'
arch=('any')
url='http://www.screenplain.com/'
license=('MIT')
depends=('python' 'python-six')
makedepends=('python-setuptools')
optdepends=('python-reportlab: PDF backend support')
source=(
    "https://github.com/vilcans/screenplain/archive/${pkgver}.tar.gz"
)
sha256sums=(
    'b506d4ec2463ea670db753f16fd88a77c6dbfb1096e5f4956c7736a117cea4f1'
)

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
    install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
