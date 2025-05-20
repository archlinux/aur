# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=meshtasticd-bin
_pkgname=meshtasticd
pkgver=2.6.4.16
pkgrel=3
pkgdesc='Meshtastic daemon for Linux systems.'
url='https://download.opensuse.org/repositories/network:/Meshtastic:/beta/Debian_Testing'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('custom')
depends=('i2c-tools' 'libgpiod' 'ulfius' 'yaml-cpp')
conflicts=("$_pkgname" "$_pkgname-git")
provides=("$_pkgname")
source_x86_64=("$url/amd64/meshtasticd_$pkgver~obsb89355f~beta_amd64.deb")
sha512sums_x86_64=('62a01d51d08aaa6d6fcd2a29c38197a106d1b5908198faac69dbd9cf84e23b3b3a1474896266d220820fc402359f39cef0cadf4294d0728fdd1761ede2eccd26')
source_i686=("$url/i386/meshtasticd_$pkgver~obsb89355f~beta_i386.deb")
sha512sums_i686=('5382918879f8622bd813cdd491fe8d03d154aab28637be1128966c98acb6389bfc76e6a7743ea865b52c05bb31e605c9c6e6095c290e78402c6e9f50361fb680')
source_armv7h=("$url/armhf/meshtasticd_$pkgver~obsb89355f~beta_armhf.deb")
sha512sums_armv7h=('2aab28fc0424ac72b8c9b4c2b5daca7e373b2b78ec5eaa01dd98750b2a0c0ea465c79854e4591d48b4c57e8e3aafccafbce017ade29fbbc1c91c7ab6096b9d78')
source_aarch64=("$url/arm64/meshtasticd_$pkgver~obsb89355f~beta_arm64.deb")
sha512sums_aarch64=('4bc0b275f8d5587c69b9b2a65c0ca197ef1a78ffd4730f89b81e2641b41e1bcf9c04d5cb0c973533f729994de8fb8490201dc95db0e723545031ea14127883d6')

# extract bin from deb file
build() {
  tar -xf "$srcdir/data.tar.xz"
}

package() {
  install -Dm755 "$srcdir/usr/sbin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm755 "$srcdir/lib/systemd/system/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"

  mkdir -p $pkgdir/etc/$_pkgname
  cp -R $srcdir/etc/$_pkgname/* $pkgdir/etc/$_pkgname
}
