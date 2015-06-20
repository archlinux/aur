# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=teeman-git
pkgver=r6.8087971
pkgrel=1
pkgdesc="Bash tool to manage your teeworlds servers"
arch=(any)
url="https://bitbucket.org/florianleleu/teeman"
license=(custom:CC-BY-SA)
depends=('bash' 'wget' 'net-tools')
makedepends=('git')
install=teeman-git.install
source=(git+https://florianleleu@bitbucket.org/florianleleu/teeman)
md5sums=(SKIP)

pkgver() {
	cd teeman
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd teeman
	install -Dm755 teeman "${pkgdir}/usr/bin/teeman"
	install -Dm644 license.txt "${pkgdir}/usr/share/licenses/teeman/license"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/teeman/README"
}
