# Maintainer: Alice <alice@alicesworld.tech>
pkgname=freetok-cpp-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r2.78ea682
pkgrel=1
pkgdesc="A libre URL extractor for tiktok"
arch=('x86_64' 'aarch64')
url="https://github.com/ProgrammerIn-wonderland/freetok"
license=('BSD')
groups=()
depends=('nlohmann-json' 'curl')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('freetok-cpp-git::git+https://github.com/ProgrammerIn-wonderland/freetok')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"


}



build() {
	cd "$srcdir/${pkgname%-VCS}/CPP"
	g++ main.cpp -O3 -lcurl -o freetok
}



package() {
	cd "$srcdir/${pkgname%-VCS}/CPP"
	mkdir -p $pkgdir/usr/bin/
	cp freetok $pkgdir/usr/bin/freetok
}
