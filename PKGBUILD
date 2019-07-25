# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=pgweb-bin
pkgver=0.11.3
pkgrel=1
pkgdesc="Web-based PostgreSQL database browser written in Go"
arch=('i686' 'x86_64')
url="https://github.com/sosedoff/pgweb"
license=('MIT')
provides=("pgweb=${pkgver}")
conflicts=("pgweb")
source=('pgweb.install' 'pgweb.env' 'pgweb.service' 'bookmark.toml.sample')
source_i686=("bin_${pkgver}_386.zip::https://github.com/sosedoff/pgweb/releases/download/v${pkgver}/pgweb_linux_386.zip")
source_x86_64=("bin_${pkgver}_amd64.zip::https://github.com/sosedoff/pgweb/releases/download/v${pkgver}/pgweb_linux_amd64.zip")
md5sums=('d45bd1fdcac2311fffa9534b430a3ee8'
         'd89944e4c4d325569f94eb56dfbe6411'
         '1362f2c1ba241a56b4c2c98bdfa2eca7'
         '2146194a1a81d4d9f1172d1ea64e0fd0')
md5sums_i686=('3b7ebc790eb443552cc1a54cdf796ff7')
md5sums_x86_64=('90ba9c87570b71665c739ed9e3913d41')
sha256sums=('cc041317281beafc22ad7dd47f3f3ae3ca5006a3f873996bc611124fc3d439d0'
            'aa58ad72a5ea730b4c2ae292e02608d3df2b882c173520737fa4afb0faa89f29'
            'b0f6b6099c2936e0dc11918799c2043831c0e4249d4dd15e77adc2d418e971a6'
            '5eae680e816a8124f0b227da33bf90637730a5ef2b32267b89344369f866c609')
sha256sums_i686=('b54c3e65435fe4e08a446ecf016393c69707ca6ed1fe10c791ce5efb375bed96')
sha256sums_x86_64=('48a62ebf7eb2422397cd3187326ed5e53df90bdb2e495eec3eb1232a1897af7f')
backup=('etc/conf.d/pgweb')
install='pgweb.install'

package() {
  cd "$srcdir"
  install -Dm644 pgweb.env "$pkgdir"/etc/conf.d/pgweb
  install -Dm644 pgweb.service "$pkgdir"/usr/lib/systemd/system/pgweb.service

  install -dm700 "$pkgdir"/etc/pgweb
  install -Dm644 bookmark.toml.sample "$pkgdir"/etc/pgweb/bookmark.toml.sample

  install -Dm755 pgweb_linux_* "$pkgdir"/usr/bin/pgweb
}
