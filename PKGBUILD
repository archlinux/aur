# Maintainer: desbma
pkgname=r128gain
pkgver=1.0.0
pkgrel=3
pkgdesc='Fast audio loudness (ReplayGain / R128) scanner & tagger'
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('LGPL')
depends=('ffmpeg' 'python' 'python-crcmod' 'python-future' 'python-mutagen' 'python-setuptools' 'python-tqdm')
makedepends=('python-pip')
conflicts=('python-ffmpeg')  # until it is updated to >= 0.2, we have to bundle it
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('0dc44677a9360de1ea414b96e47e79e95f6f284a9cd2fadcbd1938e7ec0b32abda7df1f0d049faed5fee54796c90df736b8c422a2529d61502979594f3dd137c')

package() {
    cd "${pkgname}-${pkgver}"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps 'ffmpeg-python~=0.2'
    python setup.py install --root="${pkgdir}"
}
