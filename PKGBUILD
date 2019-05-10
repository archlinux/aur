# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='certbot-dns-vultr'
pkgver='20190506'
_commit='5acb7e2b6d66f21decb3a37ed0d7ec808eefe844'
pkgrel='1'
pkgdesc='Cerbot hooks for Vultr DNS'
arch=('any')
url="https://github.com/oefd/$pkgname"
license=('MIT')
depends=('python-certifi' 'python-chardet' 'python-idna' 'python-requests' 'python-urllib3' 'certbot')
source=("https://raw.githubusercontent.com/oefd/$pkgname/$_commit/vultr-hook.py")
md5sums=('4b367f267dce06fb6ec9801f6e2b3b24')

package() {
	cd "$_gitname"
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/share/$pkgname"
	install -m755 "$srcdir/vultr-hook.py" "$pkgdir/usr/share/$pkgname/vultr-hook.py"
	ln -sf "/usr/share/$pkgname/vultr-hook.py" "$pkgdir/usr/bin/$pkgname"
}
