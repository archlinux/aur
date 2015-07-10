# Contributor: Sebastien Duquette <ekse.0x@gmail.com>
# Contributor: Martin Kozák <martinkozak@martinkozak.net>

pkgname=pfclient-beta-bin
pkgver=3.0.2080
pkgrel=1
pkgdesc="Planefinder.net sharing client"
arch=('x86_64' 'armv6h' 'armv7h')
url="https://planefinder.net/sharing/client"
license=(unknown)
install=pfclient-beta-bin.install
backup=('etc/pfclient/pfclient-config.json')
source=(
    "http://client.planefinder.net/pfclient_3.0.2080_armhf.tar.gz"
    "pfclient-beta.service"
)
md5sums=(
    '761a109f7dcc3a485958a74c7a7b27bd'
    'f2f2b11d1bd4fd216480071467a95b09'
)

prepare() {
  cd "$srcdir"
  tar -xzf pfclient_3.0.2080_armhf.tar.gz
}

package() {
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/etc/pfclient
  mkdir -p "$pkgdir"/usr/lib/systemd/system
  
  install "$srcdir"/pfclient "$pkgdir"/usr/bin/pfclient-beta
  install "$srcdir"/pfclient-beta.service "$pkgdir"/usr/lib/systemd/system
  touch "$pkgdir"/etc/pfclient/pfclient-config.json
}

#Y vim:set ts=2 sw=2 et:
