# Maintainer SimPilotAdamT <adam_tazul@outlook.com>

_pkgname=vmware-unlocker
pkgname=vmware-unlocker-bin
pkgver=4.2.4
pkgrel=1
pkgdesc="VMware macOS utilities"
arch=("x86_64")
url="https://github.com/DrDonk/unlocker"
license=("MIT")
provides=("vmware-unlocker")
conflicts=("vmware-unlocker" "vmware-unlocker-git")
depends=("vmware-workstation>=16.0.0" "bash")
source=("$url/releases/download/v$pkgver/unlocker424.zip" "vmware-unlocker-post.hook" "vmware-unlocker-pre.hook")
sha512sums=("137aa50d3a4a46c622d8f99edf5c2a0f063f65bdbbd7405b76653b5b41555ca7a860565d0995dca905fc01e6b6944c0b5114268bf264feae4ccc096fb6cbe6de"
  "3c22eb82eb02a1bee88a50f8ffcf71bd60679f53540325f56d7865c32f229dfdc02fde34a9a6f0d8f1bc8eae078c21149a2f6e3cbd6f233db1fe34296839865a"
  "68990bed2f93f7ee7b648270af8304044b8ae33bb295fa9418edc6728676d94a5443843d63f01c31c99a7381fb822fad06ed052b6eb7ae92e91e9bed8dbe1302"
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
