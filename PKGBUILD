# Maintainer: Andrew Lamarra <andrew DOT lamarra AT gmail DOT com>
pkgname=timertab
pkgver=1.5
pkgrel=1
pkgdesc="An easy way to manage your Systemd Timers."
arch=('any')
url="https://github.com/amlamarra/timertab"
license=('GPL3')
depends=('systemd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amlamarra/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('bbd12cab218016f825a3eab50bca58facb5bff4f780c89e6545083eb6dd5037f')

package () {
	install -Dm755 "$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$pkgname-$pkgver/completion/${pkgname}_completion" "$pkgdir/etc/bash_completion.d/${pkgname}_completion"
	if [ -d /usr/share/zsh/functions/Completion/Zsh ]; then
		install -Dm644 "$pkgname-$pkgver/completion/_${pkgname}" "$pkgdir/usr/share/zsh/functions/Completion/Zsh/_${pkgname}"
	fi
}
