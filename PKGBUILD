# Maintainer: JOLIMAITRE Matthieu <matthieu@imagevo.fr>
pkgname="deno-stable-bin"
pkgver=2.6.0
pkgrel=1
pkgdesc="A modern JavaScript and TypeScript runtime. Latest artefact from github."
url="https://deno.land"
arch=("x86_64" "aarch64")
license=('MIT')
depends=('gcc-libs')
source=("https://github.com/denoland/deno/releases/latest/download/deno-$arch-unknown-linux-gnu.zip")
sha256sums=("SKIP")
options=("!strip")
provides=("deno")
conflicts=("deno")

package() {
	install -Dm755 deno "$pkgdir/usr/bin/deno" 
}

pkgver() {
	./deno --version | head -n 1 | cut -d ' ' -f 2	
}
