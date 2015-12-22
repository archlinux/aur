# Maintainer: Thomas Gubler <thomasgubler@gmail.com>
_pkgname_raw=omodoro
_cmd_name=$_pkgname_raw
_install_dir=/usr/bin/
pkgname=$_pkgname_raw-git
pkgver=r27.51574fd
pkgrel=2
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
	mkdir -p "$pkgdir$_install_dir"
	cp "$srcdir/$_pkgname_raw/$_cmd_name" "$pkgdir$_install_dir"
	chmod +x "$pkgdir$_install_dir$_cmd_name"
}
