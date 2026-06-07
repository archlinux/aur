
#Mantainer: Matias Araoz <araozmatias2010@gmail.com>
pkgname=iwdtui
pkgver=1.0
pkgrel=1
pkgdesc="TUI tool for the IWD backend"
arch=(x86_64)
url='https://github.com/MatiasGabrielAraoz/IwdTUI'
license=('MIT')
depends=('iwd' 'coreutils')
makedepends=('cargo' 'git') # 'bzr', 'git', 'mercurial' or 'subversion'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MatiasGabrielAraoz/IwdTUI/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('46a16ba99fcb3ce461d7d2221824a41a7fc455cc6261d16e067a6bed62a3365d')

build() {
	cd "IwdTUI-${pkgver}"
	cargo build --release --locked
}

package() {
	cd "IwdTUI/${pkgver}"
	install -Dm755 "target/release/iwdtui" "$pkgdir/usr/bin/iwdtui"
}

