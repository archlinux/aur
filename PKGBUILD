# Maintainer: Klotz <vanziegelstein@gmail.com>

pkgname=python-getch
pkgver=1.0
pkgrel=1
pkgdesc="Does single char input, like C getch/getche"
arch=('x86_64')
url="https://pypi.org/project/getch/"
license=('custom')
makedepends=('python-setuptools')
source=('https://files.pythonhosted.org/packages/cc/a4/c696c05e0ff9d05b1886cb0210101083db7d330ff964a6d7cd98ad2b2064/getch-1.0.tar.gz'
LICENSE)
sha256sums=('a6c22717c10051ce65b8fb7bddb171af705b1175e694a73be956990f6089d8b1'
            '248a70acfab06d527d96bb64a5bb24232c00b70874190f11ff7ab7eb2cc2db96')


build() {
    cd "${pkgname#python-}-$pkgver"
    python setup.py build
}


package() {
    cd "${pkgname#python-}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1

    install -d "$pkgdir/usr/share/licenses/$pkgname"    
    install -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
