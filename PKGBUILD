# Maintainer: Marcin Mielniczuk <marmistrz.dev@zoho.eu>
pkgname=graphwar
pkgver=1.0
pkgrel=1
pkgdesc="Hit your enemies using mathematical functions"
arch=(x86_64 i686)
url="https://github.com/catabriga/graphwar"
license=('GPLv3')
depends=('java-runtime')
makedepends=('git')
source=("git+https://github.com/catabriga/graphwar.git#tag=4c73cf71073acf64c26bc303e3896c7b250d82ba")
sha1sums=("SKIP")

build() {
	cd graphwar
    make
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

