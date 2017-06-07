# Maintainer: Giuseppe <giuscri@gmail.com>
pkgname=notify-when-done-i3-git
pkgver=r4.9f1752e
pkgrel=3
pkgdesc="Get notifications when commands in non-focused i3's workspaces finish."
arch=('x86_64')
url="https://github.com/giuscri/notify-when-done-i3"
license=('WTFPL')
depends=('jq' 'i3-wm' 'bash-preexec-git' 'libnotify')
makedepends=('git')
install=notify-when-done-i3-git.install
source=("$pkgname::git+https://github.com/giuscri/notify-when-done-i3.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm0644 "$srcdir/$pkgname/nwd-preexec.sh" "$pkgdir/usr/share/nwd/nwd-preexec.sh"
    install -Dm0644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/nwd/LICENSE"
}
