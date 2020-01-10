# Maintainer: picked name <ipickedaname@mail.com>
pkgname=heca
pkgver=1.4.2
pkgrel=1
makedepends=('rust' 'cargo')
depends=('gcc-libs')
arch=('i686' 'x86_64')
pkgdesc="Hebrew calendar utility"
license=('MIT')
url="https://github.com/heca-project/heca"
source=("https://github.com/heca-project/heca/archive/v${pkgver}.tar.gz")
md5sums=('d316e5cb3c45c50df1cd10d73580b297')

check() {
	cd $srcdir/"heca-${pkgver}"
	cargo test --release --locked

}
build() {

	    cd $srcdir/"heca-${pkgver}"
	    cargo build --locked --release
    }

package() {

	    cd $srcdir/"heca-${pkgver}"
	    find . -name ".crates.toml"
	    install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
	    mkdir -p $pkgdir/usr/share/licenses/heca
	    install ./LICENSE $pkgdir/usr/share/licenses/heca/LICENSE
	}
