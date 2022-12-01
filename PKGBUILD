# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=spleeter
pkgver=1.4.0
pkgrel=1
pkgdesc='Deezer source separation library including pretrained models'
url='https://github.com/deezer/spleeter'
arch=('any')
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'ffmpeg' 'tensorflow114')
optdepends=('libsndfile: to perform evaluation')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/deezer/spleeter/archive/v${pkgver}.tar.gz")
md5sums=('b871a3b34781ba54b3a9393cc47aa477')
 
package() {
    cd "spleeter-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # environment files for use with conda
    install -Dm644 conda/spleeter-gpu.yaml "${pkgdir}/usr/share/doc/sleeter/spleeter-gpu.yaml"
    install -Dm644 conda/spleeter-cpu.yaml "${pkgdir}/usr/share/doc/sleeter/spleeter-cpu.yaml"
}
