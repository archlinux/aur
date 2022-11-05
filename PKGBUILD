# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='certbot-dns-vultr'
pkgver='20190506'
_commit='5acb7e2b6d66f21decb3a37ed0d7ec808eefe844'
pkgrel='5'
pkgdesc='Cerbot hooks for Vultr DNS'
arch=('any')
url="https://aur.archlinux.org/packages/$pkgname"
license=('MIT')
depends=('certbot' 'python' 'python-certifi' 'python-chardet' 'python-idna' 'python-requests' 'python-urllib3')
install="$pkgname.install"
source=(
	'vultr-hook.py'
	'LICENSE'
)
sha512sums=('bed005e71fee528dc8a2f96d9012f73a65571b5ce137eb38a361662076c6d50c6ed2d6fb65fead411f6cfd6203c98f93687e422fe78ff5fe410df040d8028d72'
            '3be99701a9cd1575f3d6a2e57769f1e507f75af9b09e23882a663415db8c569d10e2f4a7dd321df51571cc23c87e331b347f09bc8cf9fea86a09c191b7b54ee7')

package() {
	cd "$srcdir/"
	install -Dm755 'vultr-hook.py' "$pkgdir/usr/bin/$pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
