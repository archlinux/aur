# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=meshtasticd-bin
_pkgname=meshtasticd
pkgver=2.6.11.25
pkgrel=1
pkgdesc='Meshtastic daemon for Linux systems.'
url='https://download.opensuse.org/repositories/network:/Meshtastic:/beta/Debian_12'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('custom')
depends=('i2c-tools' 'libgpiod' 'ulfius' 'yaml-cpp')
conflicts=("$_pkgname" "$_pkgname-git")
provides=("$_pkgname")
source_x86_64=("$url/amd64/meshtasticd_$pkgver~obs60ec05e~beta_amd64.deb")
sha512sums_x86_64=('b3756851bf3a41df11bb0c77d461ef5e2221c73c28082cedabfd11da1a9152d3f04f59d1ce2557d8ca84ff064bda5ffeaef67bb330a4978be830c150ecacb923')
source_i686=("$url/i386/meshtasticd_$pkgver~obs60ec05e~beta_i386.deb")
sha512sums_i686=('d2fbb6bd909d341128084cd51e0338c1daaef260d550c2c6826036d6c371594697ec3aee8dbf3ff6c62e9581c7ff300d1c299b3e1add8c373347ba76497a1157')
source_armv7h=("$url/armhf/meshtasticd_$pkgver~obs60ec05e~beta_armhf.deb")
sha512sums_armv7h=('8f91df83b4bf70473608db87255b07e5048b166f18492b16bc989f7ae530f7afaff510120a7d5535fc28569c1325367790f5c6bb845805ac01bc8f3a81f16185')
source_aarch64=("$url/arm64/meshtasticd_$pkgver~obs60ec05e~beta_arm64.deb")
sha512sums_aarch64=('c1ebb2ec3a2c633e0fbd4c19a1dd415f8c96fb399f3a12518dc4bc62600f1de531874c4c174e662127b7cb6a9ad9d0bf812c92e8d3e391bc6dc832d8e1220a50')

# extract bin from deb file
build() {
  tar -xf "$srcdir/data.tar.xz"
}

package() {
  install -Dm755 "$srcdir/usr/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm755 "$srcdir/lib/systemd/system/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"

  mkdir -p $pkgdir/etc/$_pkgname
  cp -R $srcdir/etc/$_pkgname/* $pkgdir/etc/$_pkgname
}
