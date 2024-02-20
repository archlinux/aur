# Maintainer:
# Contributor: Michael Hauser-Raspe

pkgname=git-standup-git
pkgver=2.3.2.r8.g77051be
pkgrel=1
pkgdesc="Recall what you did on the last working day."
arch=('any')
url="https://github.com/kamranahmedse/git-standup"
license=('MIT')
depends=('bash' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --tags | sed 's/-/.r/;s/-/./g'
}

package() {
	cd "${pkgname%-git}"
	install -Dm755 -t "$pkgdir/usr/bin" git-standup
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
