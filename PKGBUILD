# Maintainer ZhangHua<zhanghua.00@qq.com>

pkgname=aria2cd
pkgver=1.1
pkgrel=2
pkgdesc="A systemd Service to start aria2 automatically."
arch=(any)
url="https://aur.archlinux.org/aria2cd.git"
license=(custom:WTFPL)
depends=(aria2 systemd)
source=(
	notify-user
	aria2cd-install
	${pkgname}.hook
	aria2.conf
	aria2@.service
	LICENSE::http://www.wtfpl.net/txt/copying
)
sha256sums=('5dd14105fcd2224c60103e5521922af0ddcb2a9ec2ef1734b092d946100019f6'
            '68416b3df5a44c8b953b7d15f554056f21acaca7c6e3353e97c7b44fc6c322ca'
            '79e7fad888a53769776f691d3ce14bd29fc617bb58267304a9b04aa6ccbf4cf5'
            'a075c9b90a4732ea7fb332e81ad50244e778977ec028a56ae0b29f895fd7db87'
            'c863595990e32eb41aa76fd55d151acb04cee401fcf219d4e418b96fdc1468b2'
            '0356258391e190dc1d44ea01565cfe627fe44e27dad693a0a54c2483a7b223e5')
package(){
	install -Dm644 ${srcdir}/aria2.conf ${pkgdir}/usr/share/aria2/aria2.conf
	touch ${pkgdir}/usr/share/aria2/dht.dat
	touch ${pkgdir}/usr/share/aria2/dht6.dat
	touch ${pkgdir}/usr/share/aria2/aria2.session
	install -Dm644 ${srcdir}/aria2@.service ${pkgdir}/usr/lib/systemd/system/aria2@.service
	install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licences/${pkgname}/LICENSE
	install -Dm644 ${srcdir}/${pkgname}.hook ${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook
	install -Dm755 ${srcdir}/notify-user ${pkgdir}/usr/share/libalpm/scripts/notify-user
	install -Dm755 ${srcdir}/aria2cd-install ${pkgdir}/usr/bin/aria2cd-install
}
