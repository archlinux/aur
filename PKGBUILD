# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=python-pynvim
pkgver=0.3.2
pkgrel=1
pkgdesc="python client and plugin host for nvim / neovim"
url="https://github.com/neovim/pynvim"
depends=('python' 'python-msgpack' 'python-greenlet')
license=('APACHE-2.0')
arch=('any')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('0a44c540dd5790acfbc7e411b0ed4fb6c44914d866226ebebf370c24c2723dc2')

build() {
    cd $srcdir/pynvim-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/pynvim-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
