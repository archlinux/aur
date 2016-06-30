# Maintainer: Michal Koutenský <koutak.m@gmail.com>
pkgname=aiu-git
pkgver=r9.303c34c
pkgrel=1
pkgdesc="Simple media manager written in sh"
arch=('i686' 'x86_64')
url="https://github.com/autrimpo/aiu"
license=()
groups=()
depends=('bash')
makedepends=('git')
provides=("${aiu%-git}")
conflicts=("${aiu%-git}")
replaces=()
backup=()
options=()
install=
source=("git://github.com/autrimpo/aiu.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm 755 "aiu" "${pkgdir}/usr/bin/aiu"
}
