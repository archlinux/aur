# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk
pkgname=netlab
pkgver=3.3
pkgrel=2
pkgdesc="The Netlab neural network toolbox for Matlab"
arch=("any")
url="http://www.aston.ac.uk/eas/research/groups/ncrg/resources/netlab"
license=('custom')
source=("$pkgname-$pkgver.tar::http://www.aston.ac.uk/EasySiteWeb/GatewayLink.aspx?alId=40595"
        "$pkgname-help-$pkgver.tar::http://www.aston.ac.uk/EasySiteWeb/GatewayLink.aspx?alId=40596"
        "foptions.m::http://www.aston.ac.uk/EasySiteWeb/GatewayLink.aspx?alId=40587")
sha256sums=('3765f8b7f8141901a4cc1e1516c211af895093eaacf94d6520251529d2ac3564'
            '039cc3d39b2db7f755065379d63a1ba28eee14be69f9bd3a2837ad133f4b9d9b'
            'aa306a0a79ba4479987c6d78e872bcf4b5751024bac887812c267010343c9074')

package() {
    install -d "$pkgdir"/opt/$pkgname
    rm "$srcdir"/*.tar
    install -m 644 "$srcdir"/* "$pkgdir"/opt/$pkgname
    install -m 644 foptions.m "$pkgdir"/opt/$pkgname

    cd "$pkgdir"/opt/$pkgname
    mkdir help
    mv *.htm help
    install -d "$pkgdir"/usr/share/doc
    ln -s /opt/$pkgname/help "$pkgdir"/usr/share/doc/$pkgname

    install -d "$pkgdir"/usr/share/licenses/$pkgname
    ln -s /opt/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}
