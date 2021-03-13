# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>

pkgname=python-vim_bridge
pkgver=0.6
pkgrel=1
pkgdesc="A Python-to-Vim bridge that allows calls to Python functions in native Vim scripts."
arch=('any')
url="https://github.com/nvie/vim_bridge"
license=('BSD')
makedepends=('python-setuptools')
source=("https://github.com/nvie/vim_bridge/archive/${pkgver}.tar.gz"
        'LICENSE')
sha256sums=('33a752e28b27ddc8f6e8f343b82194e55ed07fc6dbae7778fc5710f3add93783'
            'e62c548185b428c86c9f63bbf87ce51958b589bf7253762bd3e53379f8c0aca5')

build() {
    cd ${srcdir}/vim_bridge-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/vim_bridge-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
