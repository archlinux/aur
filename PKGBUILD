# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=meshtasticd-bin
_pkgname=meshtasticd
_buildcode='obs54e0d8d'
pkgver=2.7.26.61
pkgrel=2
pkgdesc='Meshtastic daemon for Linux systems.'
url='https://download.opensuse.org/repositories/network:/Meshtastic:/beta/Debian_13'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('custom')
depends=('i2c-tools' 'libgpiod' 'ulfius' 'yaml-cpp')
conflicts=("$_pkgname" "$_pkgname-git")
provides=("$_pkgname")
source_x86_64=("$url/amd64/meshtasticd_$pkgver~$_buildcode~beta_amd64.deb")
sha512sums_x86_64=('76acbd5715f6453874718a7bb0abecc07997ccf9b24cf1e9dea7577dbd64bbecf8b841eb53148a92251231df08dbae18d8dadb1ddf227f290ac1372eb72f3bca')
source_i686=("$url/i386/meshtasticd_$pkgver~$_buildcode~beta_i386.deb")
sha512sums_i686=('d90f0bbcd05585984a2d9739bd413598dddc2d8a3e65152837734f637292e32fd16ec1860f8a3304b7567c4e0f3789bb1aa9001a0414426a30c18a20b10d33b7')
source_armv7h=("$url/armhf/meshtasticd_$pkgver~$_buildcode~beta_armhf.deb")
sha512sums_armv7h=('ae8e6862432a14e66b0e2f6e52b235731708a74063f5b5d15badb49adf372403d4cbfa34a193c79c14fa2ad7e0d96699b1e0bd3dfeed350776eee35b7269cee4')
source_aarch64=("$url/arm64/meshtasticd_$pkgver~$_buildcode~beta_arm64.deb")
sha512sums_aarch64=('c427d9d3ea85adb68131696ffc7f55fbb207fa3b51efc4d3e2c0ee033c512f2e755f7fbafad8a2860a5a8bfc64d1ca4e6b07e7218da4e184cfa17bd7547581a0')

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
