# Maintainer: Ricardo Band <me@xengi.de>
pkgname=yabat
pkgver=0.4.1
pkgrel=1
pkgdesc="A simple battery monitor for your systray."
arch=('any')
url="https://github.com/XenGi/yabat"
license=('MIT')
depends=('python-docopt' 'python-pyqt5')
provides=('yabat')
source=("https://github.com/XenGi/yabat/archive/v$pkgver.tar.gz")
sha256sums=('9067fecfc3c91c93a5f6205351689889d97b64ce85a2f6175acf4072e1c4b1ce')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    #python setup.py install --root="$pkgdir/" --optimize=1
    
    install -D -m755 yabat "${pkgdir}/usr/bin/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/${pkgname}/default/"
    mkdir -p "${pkgdir}/usr/share/${pkgname}/horiz/"
    chmod -R 755 "${pkgdir}/usr/share/${pkgname}"
    install -D -m644 default/* "${pkgdir}/usr/share/${pkgname}/default/"
    install -D -m644 horiz/* "${pkgdir}/usr/share/${pkgname}/horiz/"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 yabatrc "${pkgdir}/etc/${pkgname}rc"
}
