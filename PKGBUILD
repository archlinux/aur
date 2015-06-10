# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: maoserr

pkgname=redshiftgui-bin
pkgver=0.2.4
pkgrel=1
pkgdesc='Monitor color adjustment tool'
arch=('x86_64' 'i686')
url='http://github.com/maoserr/redshiftgui'
license=('GPL2')
depends=('gtk2' 'curl' 'libxcb' 'libxrandr' 'libxxf86vm' 'libsm')
replaces=('redshiftgui')
if [[ $CARCH = x86_64 ]]; then
  source=("https://github.com/maoserr/redshiftgui/releases/download/$pkgver-Arch64/RedshiftGUI-$pkgver-Linux-x86_64.tar.gz"
          'redshiftgui.sh')
  sha256sums=('1170e8d8eca1b7b936ffb5e70763259b3f15db810bf2d05b3b0221d8e35bbb27'
              'df03e192fe32bda2ea546be85faf51c030ae8dd46c40aad229e39b6b296897b5')
else
  source=("https://github.com/maoserr/redshiftgui/releases/download/$pkgver-Arch64/RedshiftGUI-$pkgver-Linux-i686.tar.gz"
          'redshiftgui.sh')
  sha256sums=('4d34de7b9bf106569bd7b87f2cd96640e60f723cf27e37e89219c8ea5b14cb2d'
              'df03e192fe32bda2ea546be85faf51c030ae8dd46c40aad229e39b6b296897b5')
fi

package() {
  cd "RedshiftGUI-${pkgver}-Linux-${CARCH}"
  install -Dm755 bin/redshiftgui "$pkgdir/usr/bin/redshiftgui.elf"
  install -Dm755 "$srcdir/redshiftgui.sh" "$pkgdir/usr/bin/redshiftgui"
  install -d "$pkgdir/usr/share"
  mv share/* "$pkgdir/usr/share/"
}

# vim:set ts=2 sw=2 et:
