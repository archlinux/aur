# Maintainer: Neokobase-Anstari <okobenoko@outlook.com>

pkgname=nyalcf-bin
pkgver=0.1.7
pkgrel=2
pkgdesc='Nya LoCyanFrp! Launcher | 乐青映射启动器'
arch=('x86_64')
url="https://github.com/Muska-Ami/NyaLCF"
license=('MIT')
depends=('gtk3' 'libayatana-appindicator')
optdepends=('frpc: builtin frpc support')
source=("$url/releases/download/v$pkgver+rc2/nyalcf-$pkgver+rc2-linux.deb" 'nyanana.sh')
#source=("https://slink.ltd/$url/releases/download/v$pkgver+rc2/nyalcf-$pkgver+rc2-linux.deb") # Mirror link
sha256sums=('ea7746f200c421f197669d31dbfe2305f4eca1fde2044a0d2184ec5785438b4a'
            'SKIP')

package() {
	bsdtar -xvf data.tar.zst -C "${pkgdir}/"
  chmod +x nyanana.sh
	mkdir -p "${pkgdir}/usr/bin/"
  install -Dm755 nyanana.sh "${pkgdir}/usr/bin/nyanana"
}

post_install() {
  echo "If you want to specify the path of frpc, run \"nyanana [YOUR_FRPC_PATH]\""
}
