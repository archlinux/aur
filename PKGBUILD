# Maintainer: Bastien Traverse <neitsab at esrevart dot net>

pkgname=autotranscode
pkgver=0.9.8
pkgrel=1
pkgdesc="A simple, fast and reliable music library transcoder"
arch=('any')
url="https://pypi.org/project/autotranscode/"
license=('GPL3')
depends=('python-tqdm' 'ffmpeg')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('84aec4c3660a36211752f167e9fc3609')

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
    install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}

