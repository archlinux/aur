# Maintainer: sp1rit <sp1ritCS@protonmail.com>
pkgname=superhackertool5000-git
pkgver=16.0.0
pkgrel=1
pkgdesc="A stupid program meant to seem like it is doing things it clearly isn't. Inspired by the nerds on r/masterhacker."
arch=("any")
license=("unkown")
url="https://github.com/0xDEFEC/SuperHackerTool5000"
provides=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/0xDEFEC/SuperHackerTool5000.git")
md5sums=("SKIP")

build() {
    cd "$srcdir/${pkgname%-git}/SuperHackerTool5000"
    mkdir -p build && cd build
	cmake -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    install -Dm755 $srcdir/${pkgname%-git}/SuperHackerTool5000/build/SuperHackerTool5000 "$pkgdir/usr/bin/SuperHackerTool5000"
    ln -s "$pkdir/usr/bin/SuperHackerTool5000" "$pkgdir/usr/bin/superhackertool5000"
    ln -s "$pkdir/usr/bin/SuperHackerTool5000" "$pkgdir/usr/bin/sht5k"
}
