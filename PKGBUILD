# Maintainer: Cmd-GZ <newsupergodg@gmail.com>
# Contributor: Marcin Mielniczuk <marmistrz.dev@zoho.eu>
pkgname=graphwar-git
pkgver=r33.1f474e6
pkgrel=1
pkgdesc="Hit your enemies using mathematical functions"
arch=(x86_64 i686)
url="https://github.com/catabriga/graphwar"
license=('GPLv3')
depends=('java-runtime')
makedepends=('git')
source=("git+https://github.com/catabriga/graphwar.git")
sha1sums=("SKIP")

build() {
	cd graphwar
	git checkout 1f474e6
    ./compile.sh
}

package() {
    cd graphwar
	dest="$pkgdir/usr/share/games/graphwar/"
	mkdir -p "$dest"
	cp -r "graphwar.jar" "$dest"

    mkdir -p "$pkgdir/usr/bin"
    echo -e "#!/bin/sh\njava -jar /usr/share/games/graphwar/graphwar.jar" > "$pkgdir/usr/bin/graphwar"
    chmod +x "$pkgdir/usr/bin/graphwar"
}

