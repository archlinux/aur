# Maintainer: Erik Sabowski <airyk@sabowski.com>
pkgname=bitwarden-ssh-agent-git
pkgver=r21.55c9342
pkgrel=1
pkgdesc="Load bitwarden store ssh keys into ssh-agent"
arch=('any')
url="https://github.com/joaojacome/bitwarden-ssh-agent"
license=('MIT')
depends=('python')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/joaojacome/bitwarden-ssh-agent.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "bw_add_sshkeys.py" "${pkgdir}/usr/bin/bw_add_sshkeys" 
}
