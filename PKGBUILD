# Maintainer: Giuseppe <giuscri@gmail.com>
pkgname='notify-when-done-i3-git'
pkgver=r30.7b8990f
pkgrel=1
pkgdesc="Get notifications when commands in non-focused i3's window finish."
arch=('x86_64')
url="https://github.com/giuscri/notify-when-done-i3"
license=('WTFPL')
depends=('i3-wm' 'bash-preexec-git' 'libnotify' 'python')
makedepends=('git')
install=nwd-i3-git.install
source=("$pkgname::git+https://github.com/giuscri/notify-when-done-i3.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm0644 "$srcdir/$pkgname/preexec.sh" "$pkgdir/usr/share/nwd/preexec.sh"
    install -Dm0644 "$srcdir/$pkgname/focused_window.py" "$pkgdir/usr/share/nwd/focused_window.py"
    install -Dm0644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/nwd/LICENSE"
}
