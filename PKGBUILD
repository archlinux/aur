# Maintainer: GrayJack <gr41.j4ck@gmail.com>

pkgname="python-gdf-formatter"
pkgver=1.0.1
pkgrel=1
pkgdesc='A simple and flexible Python library to create and format your graphs in GDF format.'
arch=('any')
url='https://github.com/GabrielTrettel/GDF_Formatter'
license=('MPL')
depends=('python>=3')
makedepends=('python-setuptools')
source=("${url}/archive/v.${pkgver}.tar.gz"
        "READMEPYPI.md")
sha256sums=('4118cf662a3462120b26220838290ed98ee5686c0aae0ce11ab611aca7a037ba'
            'e22e54d86f432183e49148c34774644d347e4a2052b8ba6a9f3d447f05e1ac8c')

build() {
    cp READMEPYPI.md GDF_Formatter-v.${pkgver}
    cd GDF_Formatter-v.${pkgver}
    python setup.py build
}

package() {
    cd GDF_Formatter-v.${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1

    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
