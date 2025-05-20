# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-system76-power
pkgver=48
pkgrel=1
pkgdesc="GNOME shell extension for System76 Power Management"
arch=('any')
url="https://gitlab.com/LFd3v/gnome-shell-extension-system76-power"
license=('MIT')
depends=(
  'gnome-shell'
  'system76-power'
)
makedepends=(
  'git'
  'typescript'
)
source=("git+https://gitlab.com/LFd3v/gnome-shell-extension-system76-power.git#tag=v$pkgver")
sha256sums=('cb37eb16e42989cef3c51b695d80f4ea21c7169006c36f13250fc5c09a781f12')

build(){
  cd "$pkgname"
  make
}


package() {
  cd "$pkgname"
  make DESTDIR="${pkgdir}" install

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
