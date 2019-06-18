# Maintainer: actra.development <opensource@actra.de>
pkgname=mkinitcpio-knockencryptssh
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="Remotely unlock LUKS over SSH with keyfile support by port-knocking first"
arch=('any')
url="https://github.com/actra-development-oss/mkinitcpio-knockencryptssh"
license=('MIT')
groups=()
depends=('mkinitcpio'
        'knockd'
        'inotify-tools'
        'cryptsetup'
        'device-mapper'
        'gawk'
        'bash')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=('etc/knockencryptssh/knockd.conf')
options=()
install='mkinitcpio-knockencryptssh.install'
changelog=
source=('https://raw.githubusercontent.com/actra-development-oss/mkinitcpio-knockencryptssh/master/mkinitcpio-knockencryptssh.tar.gz')
noextract=()
md5sums=('fdc6570659e482210dae8978b11f0357')
validpgpkeys=()

package() {
  install -Dm 644 src/usr/lib/initcpio/hooks/knockencryptssh "${pkgdir}/usr/lib/initcpio/hooks/knockencryptssh"
  install -Dm 644 src/usr/lib/initcpio/install/knockencryptssh "${pkgdir}/usr/lib/initcpio/install/knockencryptssh"
  mkdir -p -m 755 "${pkgdir}/etc/knockencryptssh"
  install -Dm 644 src/etc/knockencryptssh/knockd.conf "${pkgdir}/etc/knockencryptssh/knockd.conf"
  install -Dm 755 src/etc/knockencryptssh/knocked.sh "${pkgdir}/etc/knockencryptssh/knocked.sh"
  mkdir -p -m 755 "${pkgdir}/usr/share/mkinitcpio-knockencryptssh/utils/shells"
  install -Dm 755 src/utils/shells/cryptsetup_shell "${pkgdir}/usr/share/mkinitcpio-knockencryptssh/utils/shells/cryptsetup_shell"
  mkdir -p -m 644 "${pkgdir}/usr/share/mkinitcpio-knockencryptssh/examples"
  install -Dm 644 src/examples/linux.sh "${pkgdir}/usr/share/mkinitcpio-knockencryptssh/examples/linux.sh"
  install -Dm 644 src/examples/windows.bat "${pkgdir}/usr/share/mkinitcpio-knockencryptssh/examples/windows.bat"
}