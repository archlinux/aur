#Maintainer Matthijs Tadema <M dot J dot Tadema at pm dot me>
#Previous Maintainer Jens Staal <staal1978@gmail.com>

pkgname=ugene-bin
pkgver=39.0
pkgrel=1
pkgdesc="A free cross-platform genome analysis suite (binary release)"
arch=('x86_64')
url="http://ugene.net"
license=('GPL')
depends=('qt5-script' 'qt5-svg' 'qt5-webkit' 'glu' 'procps-ng' 'python')
provides=('ugene')
conflicts=('ugene')
source=("https://github.com/ugeneunipro/ugene/releases/download/${pkgver}/ugene-${pkgver}-linux-x86-64.tar.gz" "ugene.desktop")
sha256sums=('f04fcfdf62703e9feba2fd6fd3b74b19cf676c65d312d0d3b08f5622dc2081cf'
            'b8f623413b40fb793d1b3e3c6234c2fab2c7f69c23fdf09fa5df9b93f4e57217')

package() {
    cd "$srcdir/ugene-$pkgver"
    mkdir -p "${pkgdir}/usr/"{bin,share/{applications,icons,ugene}}
    tar -xf icons.tar.gz -C $pkgdir/usr/share/icons
    mv * $pkgdir/usr/share/ugene
    ln -s /usr/share/ugene/ugene "$pkgdir"/usr/bin/ugene
    install -D -m 755 ${srcdir}/*.desktop "${pkgdir}/usr/share/applications"
}

