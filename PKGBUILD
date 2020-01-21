# Maintainer: VVL <me@ivvl.ru>
# Contributor: VVL <me@ivvl.ru>

pkgname=letsencrypt-cloudflare-hook
pkgver=20191202.b7e4e5a
pkgrel=1
pkgdesc="CloudFlare hook for dehydrated"
arch=(any)
url="https://github.com/walcony/letsencrypt-cloudflare-hook"
license=('MIT')
source=("git+https://github.com/walcony/letsencrypt-cloudflare-hook.git")
depends=('dehydrated' 'python' 'python-dnspython' 'python-future' 'python-requests' 'python-six' 'python-tld')
makedepends=('git')
sha256sums=('SKIP')
package() {
	cd "$pkgname"
	install -Dm755 "hook.py" "$pkgdir/etc/dehydrated/hooks/$pkgname.py"
	install -Dm644 README.md -t "$pkgdir/usr/share/docs/$pkgname"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

