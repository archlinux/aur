# Maintainer: Will Price <will.price94+aur@gmail.com>
pkgname=probe
pkgver=1.30
pkgrel=1
epoch=
pkgdesc="ProBE is an animator for CSP processes allowing the user to
explore the behaviour of models interactively"
arch=('x86_64' 'i686')
url="http://www.fsel.com/probe_download.html"
license=('Custom')
groups=()
if [ $CARCH = 'x86_64' ]; then
    depends=('lib32-libxext')
else
    depends=()
fi
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('http://www.fsel.com/download/probe-1.30-linux6.tar.gz')
noextract=()
md5sums=('8c1809f326ea0cf8013d0e4b24c7e6ac')

package() {
    mkdir -p "$pkgdir"/usr/{share/{doc/probe,probe},bin}

    cd "$srcdir/$pkgname-$pkgver-linux6"
    install -m 755 probe "$pkgdir/usr/share/probe/"
    install -m 755 README "$pkgdir/usr/share/doc/probe/"
    install -m 755 -T Licence "$pkgdir/usr/share/doc/probe/LICENSE"
    ln -s /usr/share/probe/probe "$pkgdir/usr/bin"
}
