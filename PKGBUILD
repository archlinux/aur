#Mantainer: Matias Araoz <araozmatias2010@gmail.com>
pkgname=iwdtui
pkgver=1.1
pkgrel=1
pkgdesc="TUI tool for the IWD backend"
arch=(x86_64)
url='https://github.com/MatiasGabrielAraoz/IwdTUI'
license=('MIT')
depends=('iwd' 'coreutils')
makedepends=('cargo' 'git') # 'bzr', 'git', 'mercurial' or 'subversion'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MatiasGabrielAraoz/IwdTUI/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fefbfc18f1ea030e431598ee363a2580be09f7ffe94525d88f1ef04fc516a6e5')

build() {
	cd "IwdTUI-${pkgver}"
	cargo build --release --locked
}

package() {
	cd "IwdTUI-${pkgver}"
	install -Dm755 "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
}

