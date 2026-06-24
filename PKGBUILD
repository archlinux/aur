# Maintainer: xiaot <me@xiaot.moe>

pkgname=sparxie-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="跨平台代理控制器。"
arch=('x86_64' 'aarch64')
url="https://github.com/UruhaLushia/sparxie"
depends=("gtk3")
optdepends=('noto-fonts-cjk: CJK support'
            'noto-fonts-emoji: Emoji support')
provides=("sparxie=${pkgver}")
conflicts=('sparxie' 'sparxie-git')
options=(!strip)
license=('GPL-3.0-only')
source_x86_64=("https://github.com/UruhaLushia/sparxie/releases/download/v${pkgver}/sparxie-linux-x86_64.deb")
sha256sums_x86_64=('d80acff84b859adbdf9d983945cd387b623f0d7abd75648bd47f9687574b8f9b')
source_aarch64=("https://github.com/UruhaLushia/sparxie/releases/download/v${pkgver}/sparxie-linux-arm64.deb")
sha256sums_aarch64=('ed4b51167d1c14a29f3ff758cb4dd4678dc2d1c380252f301351615a9fcf9212')

prepare() {
	cd $srcdir
	bsdtar -xf data.tar.gz
}

package() {
        cd $srcdir
        cp -R usr ${pkgdir}
}
