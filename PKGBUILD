# Maintainer: Thomas Gubler <thomasgubler@gmail.com>
pkgname_raw=omodoro
cmd_name=$pkgname_raw
install_dir=/usr/bin/
pkgname=$pkgname_raw-git
pkgver=r27.51574fd
pkgrel=1
pkgdesc="Simple commandline tool to use the pomodoro technique"
arch=('any')
url="https://github.com/okraits/omodoro"
license=('GPL2')
groups=('any')
depends=('python' 'libnotify')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%}")
conflicts=("${pkgname%}")
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+http://github.com/okraits/omodoro.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	mkdir -p "$pkgdir$install_dir"
	cp "$srcdir/$pkgname_raw/$cmd_name" "$pkgdir$install_dir"
	chmod +x "$pkgdir$install_dir$cmd_name"
}
