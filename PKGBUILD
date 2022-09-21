# Maintainer SimPilotAdamT <adam_tazul@outlook.com>

_pkgname=vmware-unlocker
pkgname=vmware-unlocker-bin
pkgver=4.2.3
pkgrel=1
pkgdesc="VMware macOS utilities"
arch=("x86_64")
url="https://github.com/DrDonk/unlocker"
license=("MIT")
provides=("vmware-unlocker")
conflicts=("vmware-unlocker" "vmware-unlocker-git")
depends=("vmware-workstation>=16.0.0")
source=("$url/releases/download/V$pkgver/unlocker423.zip" "vmware-unlocker-post.hook" "vmware-unlocker-pre.hook")
sha512sums=("2345b049e260551162e78db10f3f3e5edbade071f7360b21b695253f1cc6dcb20937dd43401a75e16affdfdbd69ba505e41120ed56a43ff63accb1a372e31f5e"
  "9562d829c593d45fd77eee19652b30ef3c33b0c67057b7e3fb4d39695d6b39659ddc06f64d0325ea02a400121a050e2bd0858a606e2a6627a40af8e87c8a378b"
  "c95c021915665fbda50c4ce739b76d92c0616d102e05033aa5b4e0ebd933e61b775ffb6ef0cf65eaf392958b8bb4125932c3cf49dd705ebb6f43cc121eccb0b3"
)

build() {
  printf ""
}

package() {
  mkdir -p "$pkgdir/usr/iso/"
  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/backup/"
  mkdir -p "$pkgdir/etc/pacman.d/hooks/"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm755 "$srcdir/linux/"* "$pkgdir/usr/bin/"
  install -Dm644 "$srcdir/iso/"* "$pkgdir/usr/iso/"
  install -Dm644 "$srcdir/"*.hook "$pkgdir/etc/pacman.d/hooks/"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
