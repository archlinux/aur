# Maintainer: pappy@a_s_c_e_l_i_o_n.c_o_m

pkgname=dbeaver-ce
pkgver=6.3.0
pkgrel=4
pkgdesc="An universal database tool for developers and database administrators. Community Edition"
arch=('x86_64')
url="https://github.com/dbeaver/dbeaver"
license=("GPL")
depends=('java-runtime>=1.6' 'gtk2' 'gtk-update-icon-cache')
install=dbeaver-ce.install
conflicts=(dbeaver dbeaver-ee)

source=("$pkgname-$pkgver-linux.gtk.x86_64.tar.gz::https://github.com/dbeaver/dbeaver/releases/download/$pkgver/$pkgname-$pkgver-linux.gtk.x86_64.tar.gz"
		dbeaver-ce.desktop dbeaver-ce.install)
sha256sums=('4a086f0182d349bbcc8d9c927e293d7b937eef90b8dcffff47db41e9a6c8421e'
            'f100de471b371c729262611f87ef3f5ad21b8f555758c679302dabd524ebf997'
            '0c2a75baa39459fa56159e982d9f28c966837561bd52dffd24bac87b8d65555f')

package() {
    mkdir -p $pkgdir/usr/{bin,share/{applications,icons/hicolor/48x48/apps}}

    cp -a $srcdir/dbeaver $pkgdir/usr/share/$pkgname
    chmod +x $pkgdir/usr/share/$pkgname/dbeaver
    cp -a $pkgdir/usr/share/$pkgname/icon.xpm $pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.xpm
    ln -s /usr/share/$pkgname/dbeaver $pkgdir/usr/bin/dbeaver-ce
    install -m 644 $srcdir/dbeaver-ce.desktop $pkgdir/usr/share/applications/
}

