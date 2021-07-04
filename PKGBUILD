# Maintainer: Simone Gaiarin <simgunz@gmail.com>
pkgname=pdftoceditor
pkgver=1.0
pkgrel=2
pkgdesc="Update the table of content of a PDF using a simple text file format."
arch=('any')
url="https://github.com/simgunz/pdftoceditor"
license=('MIT')
depends=('pdftk' 'python-docopt' 'java-commons-lang')
source=("https://github.com/simgunz/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('5f6fb201dcfab935eebde502db585ca3')

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"
    sed -i s/pdftoceditor.py/pdftoceditor/g pdftoceditor.py
    mv pdftoceditor.py pdftoceditor
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -D pdftoceditor "$pkgdir/usr/bin/pdftoceditor"
    install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE.md
}
