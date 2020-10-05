# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=drawbot-skia
pkgver=0.4.4
pkgrel=1
pkgdesc='A tool for the removal of TrueType instruction sets (hints) in fonts'
arch=(any)
url="https://github.com/justvanrossum/$pkgname"
license=('MIT')
depends=('python'
         'python-bidi'
         'python-fonttools'
         'python-skia'
         'python-skia-pathops'
         'python-uharfbuzz'
         'python-unicodedata2')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('a89519fb7939663aa824ef1b8f10d0f43aa93a32dceca91bcd95d6040a97190b')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
