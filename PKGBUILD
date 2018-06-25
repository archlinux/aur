# Maintainer: Aaron Fischer <mail@aaron-fischer.net>

pkgname=razen
pkgver=1.0.1
revision=2207
pkgrel=1
pkgdesc='A cross-platform PCB design tool that allows you to quickly design and fabricate boards.'
depends=('mercurial')
arch=('i686' 'x86_64')
url='http://razencad.com/'
license=('freeware')

source=("https://s3.amazonaws.com/razen/razen-lin64-${pkgver}-r${revision}.tar.gz"
	      'razen.sh')
sha512sums=('478fb43b26640742fedfed0ff692e7da7c2c1c45f3e5863ba9c8231e029dfb0cfa95b89574a00570ecdf4413c0fddeb08c1ed9cf69da5eb89cc1e1d583e26235'
            '17388b659998345126f02024f3e2dff411588538d10540a20a3428b3036c707a97f39acbcb737def9d2686501de5903054a8f6c6e8c22005d78cda87092dc4a0')

package() {
    mkdir -p "${pkgdir}/opt/"
    cp -R ${srcdir}/razen ${pkgdir}/opt/razen

    touch ${pkgdir}/opt/razen/razen.log
    chmod 666 ${pkgdir}/opt/razen/razen.log

    install -Dm755 razen.sh ${pkgdir}/usr/bin/razen
}
