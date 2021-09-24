# Maintainer ZhangHua<zhanghua.00@qq.com>

pkgname=aria2cd
pkgver=1.0
pkgrel=8
pkgdesc="A systemd Service to start aria2 automatically."
arch=(any)
url="https://aur.archlinux.org/aria2cd.git"
license=(custom:WTFPL)
depends=(aria2 systemd)
source=(
	notify-user
	${pkgname}.hook
	aria2.conf
	aria2@.service
	LICENSE::http://www.wtfpl.net/txt/copying
)
sha256sums=('6cde5c3c4877fff8d7804ae958ab3cc6dad366e4275f757b0f7f146427450f8d'
            '182b39e8f4f9cc979aa9cbaebbbb88298f009bfdb1c0bcb2d44fa538ff9fe73c'
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
}
