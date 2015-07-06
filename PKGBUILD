# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=dput-ng
pkgver=1.6
pkgrel=1
pkgdesc='like dput, but better'
url='http://dput-ng.debian.net/'
makedepends=('python2-setuptools')
depends=('python2-debian')
license=('GPL')
arch=('any')
provides=('dput')
conflicts=('dput')
source=("https://pypi.python.org/packages/source/d/dput/dput-${pkgver}.tar.gz"
        'dput' 'dcut' 'dirt')

build() {
    cd "${srcdir}/dput-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/dput-${pkgver}"
    python2 setup.py install --skip-build -O1 --root="$pkgdir"
    install -d "${pkgdir}/usr/bin"
    install -D "${srcdir}/dput" "${pkgdir}/usr/bin/"
    install -D "${srcdir}/dirt" "${pkgdir}/usr/bin/"
    install -D "${srcdir}/dcut" "${pkgdir}/usr/bin/"
}

sha256sums=('dcbbd3876bfac56304021070069a23e7da2e73c2024f68b0efce0cc0523bb683'
            'a4c28ed018b8d03249e8e7b94be526f29f659c97f99884d0b84e4236e94125ca'
            'a260f48111cecf8332c51f2fd45e1972c364582ff26582a5915456966482ea6f'
            'c9b54bea22ff081c08e9fab4a45135783881808323bba8dc002fa0b56915dd1c')
