# Maintainer: yinflying <yinflying@foxmail.com>
_proname=caj2pdf
pkgname=caj2pdf-git
pkgver=0.0.1
pkgrel=2
pkgdesc="Convert CAJ (China Academic Journals) files to PDF"
arch=('x86_64')
url="https://github.com/JeziL/caj2pdf"
license=('GPLv3')
depends=('git' 'python3' 'mupdf-tools')
provides=('caj2pdf')
source=("${_proname}::git+https://github.com/JeziL/caj2pdf.git#branch=master")
md5sums=('SKIP')

package() {
    # install bin file
    mkdir -p "$pkgdir/usr/share/${pkgname}"
    install -Dm755 "$srcdir/${_proname}/caj2pdf" "$pkgdir/usr/share/${pkgname}/caj2pdf"
    install -Dm644 "$srcdir/${_proname}/cajparser.py" "$pkgdir/usr/share/${pkgname}/cajparser.py"
    install -Dm644 "$srcdir/${_proname}/utils.py" "$pkgdir/usr/share/${pkgname}/utils.py"
    if [ ! -d ${pkgdir}/usr/bin ];then
        mkdir -p ${pkgdir}/usr/bin
    fi
    ln -s "/usr/share/$pkgname/caj2pdf" "$pkgdir/usr/bin/caj2pdf"
}
