# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: Slimbook <dev at slimbook dot es>
pkgname=slimbookamdcontroller
pkgver=0.4.5
pkgrel=2
pkgdesc="Application for the performance management of AMD processors"
arch=('any')
url="https://github.com/Slimbook-Team/slimbookamdcontroller"
license=('GPL-3.0-or-later')
depends=(
  'gtk3'
  'libayatana-appindicator'
  'libnotify'
  'python-cairo'
  'python-gobject'
  'python-matplotlib'
  'python-pyamdgpuinfo'
  'ryzenadj'
  'systemd-libs'
)
#source=("$url/releases/download/v$pkgver/${pkgname}_${pkgver}_all.deb")
source=("https://launchpad.net/~slimbook/+archive/ubuntu/slimbook/+files/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('d3841d98951ca37f6bf11269189cddd57bbd6981250da156942b61c870d8ca55')

package() {
  bsdtar xf data.tar.zst -C "$pkgdir"

  # App permissions
  chmod +x "$pkgdir/usr/lib/systemd/system-sleep/$pkgname"
  chmod -R 755 "$pkgdir/usr/share/$pkgname/src/"
}
