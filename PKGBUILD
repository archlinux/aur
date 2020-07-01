# Maintainer: CYBERDEViL <cyberdevilnl at protonmail dot com>
pkgname=searx-qt
pkgver='0.1beta'
pkgrel=1
pkgdesc="Lightweight desktop application for Searx"
arch=('i686' 'x86_64')
url="https://notabug.org/CYBERDEViL/searx-qt/"
license=('GPLv3')
depends=('python' 'python-requests' 'python-pyqt5')
optdepends=('python-pysocks: socks proxy support')
source=("https://notabug.org/CYBERDEViL/searx-qt/archive/0.1-beta1.tar.gz")
sha256sums=('9360665f8640f7e0b29318c7503305cf8df21f533ecdd804f312d26e9c47e534')

package() {
    cd "$srcdir/searx-qt"
    python setup.py install --root="${pkgdir}/" --optimize=1

    mkdir "$pkgdir/usr/bin/"
    install -Dm 755 "bin/searx-qt" "$pkgdir/usr/bin/"
    install -Dm 644 "share/searx-qt.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
