# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=python-pdf2image
_name=pdf2image
pkgver=1.17.0
pkgrel=1
pkgdesc="Python wrapper around the pdftoppm and pdftocairo command line tools to convert PDF to a PIL Image list"
url="https://github.com/Belval/${_name}"
arch=('any')
license=('MIT')
depends=('python' 'python-pillow' 'poppler')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Belval/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('a74579901e597559782c3357ea686cc92f358a4362ac309cf23843ad15b4f5d00b7d483098e8046c0edb83ae95cbf3155e02f84a8101da4034fe4bb201191a1d')

build() {
    cd "$srcdir/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${_name}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
