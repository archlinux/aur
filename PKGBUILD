#Maintainer: Lunatic <lunaticzy9527 at gmail dot com>

pkgname=iflyime
pkgver=0.9.972
pkgrel=2
pkgdesc="XunFei for Linux (iflyime)"
arch=('i686' 'x86_64')
url="http://srf.xunfei.cn/"
license=(custom)
depends=("fcitx" "dtkwidget")
source=(
        "iflyime_${pkgver}_amd64.deb::http://packages.deepin.com/deepin/pool/non-free/i/iflyime/iflyime_${pkgver}_amd64.deb"
        "https://srf.xunfei.cn/linux/help/agreement.html"
)
md5sums=(
        'ff2bf9d1852b94faa19825eaae83475d'
        'SKIP'
)

package() {
        cd ${srcdir}
	tar -xvf data.tar.xz -C "${pkgdir}"

        mv "${pkgdir}"/usr/lib/*-linux-gnu/fcitx "${pkgdir}"/usr/lib/
        rmdir "${pkgdir}"/usr/lib/*-linux-gnu
        chown -R root:root "${pkgdir}"
        chmod -R 755 "${pkgdir}"
        install -D -m644 agreement.html ${pkgdir}/usr/share/licenses/$pkgname/license.html
}
