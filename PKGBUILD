#Maintainer: Benjamin Reich <aur@benjaminreich.de>
#Source found on github.com/b-reich/aur
pkgname=smap-bin # '-bzr', '-git', '-hg' or '-svn'
pkgver=0.1.12
pkgrel=2
pkgdesc="a drop-in replacement for Nmap powered by shodan.io "
arch=('x86_64')
url="https://github.com/s0md3v/Smap"
license=('GPL3')
groups=()
depends=()
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
replaces=()
backup=()
options=()
install=
source=("${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.xz")
#source=("https://github.com/s0md3v/Smap/releases/download/0.1.0/smap_0.1.0_linux_amd64.tar.xz")
#source=("https://github.com/s0md3v/Smap/releases/download/0.1.0/smap_0.1.0_liunx_amd64.tar.xz")
noextract=()
sha256sums=('3aba808de98c450f4b2b35df9b4ad6ef08bde79a697c44f0365e3d2e9d1a60d3')

package() {
  cd "$srcdir/${pkgname%-bin}_${pkgver}_linux_amd64"
  install -Dm755 ${pkgname%-bin} "$pkgdir"/usr/bin/${pkgname%-bin}
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
