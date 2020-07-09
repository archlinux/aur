# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
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
sha256sums=('43c495691b0eb56d11f1d63beb6ecd5d24c8b7c4919af1282db1d3269c551e0f'
            '64d6e8ad6b22d73c7df31f140996f0f0356d1837199f048d3d544c032ad9823e')

package() {
	cd "$srcdir/"
	install -Dm755 'vultr-hook.py' "$pkgdir/usr/bin/$pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
