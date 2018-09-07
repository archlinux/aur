# Maintainer: Austin Riba <austin@m51.io>
pkgname=tuimoji
pkgver=1.0.0
pkgrel=3
pkgdesc="A terminal based emoji browser"
arch=('any')
url="https://github.com/Fingel/tuimoji"
license=('GPLV3')
depends=('python-setuptools' 'python-urwid' 'xclip')
optdepends=('noto-fonts-emoji: Google font providing full color emojis')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('29990d30146387781643fc409865d687')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
