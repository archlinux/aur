# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>

pkgname=0xff
pkgver=1.1.0
pkgrel=1
pkgdesc="Simple http(s) file sharing tool. Think 'python -m http.server' but better."
arch=('x86_64')
url='https://github.com/xengi/0xff'
license=('MIT')
source=("https://github.com/XenGi/0xff/releases/download/v${pkgver}/0xff")
sha256sums=('ab79535ec5e56484f0c1a845a185a2555aaa8f998c4d7744f6d62a2ae8b11c14')
install='0xff.install'

package() {
  cd "${srcdir}"
  install -Dm 755 0xff "${pkgdir}/usr/bin/0xff"
  install -Dm 644 ../nginx.conf "${pkgdir}/usr/share/0xff/nginx.conf"
  install -Dm 644 ../0xff.service "${pkgdir}/lib/systemd/system/0xff.service"
}
