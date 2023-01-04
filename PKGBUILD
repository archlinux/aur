# Maintainer: Paul Schaefer <realcyber.de: paul>

pkgname=pandoc-secnos
pkgver=2.2.2
pkgrel=1
pkgdesc="Section number filter for pandoc"
url="https://github.com/tomduck/pandoc-secnos"
depends=('pandoc-xnos>=2.5.0' 'pandoc-xnos<3.0')
license=('GPL')
arch=('any')
source=("https://github.com/tomduck/pandoc-secnos/archive/${pkgver}.tar.gz")
md5sums=('88f658c1ce21e9b555a799a55824b24d')

build() {
    cd "$srcdir/pandoc-secnos-${pkgver}"
    sed -ni '1,66p' setup.py
    python setup.py build
}

package() {
    cd "$srcdir/pandoc-secnos-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
