# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=pgweb-bin
pkgver=0.11.11
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
         'a2f71b3389ccf56ea6921123cf93d0d3'
         '2146194a1a81d4d9f1172d1ea64e0fd0')
md5sums_i686=('65b1357cb9a32deeb2cea0e769d9dff3')
md5sums_x86_64=('53668bfab222768311c47ceed2c3a944')
sha256sums=('cc041317281beafc22ad7dd47f3f3ae3ca5006a3f873996bc611124fc3d439d0'
            'aa58ad72a5ea730b4c2ae292e02608d3df2b882c173520737fa4afb0faa89f29'
            'ec7dca09ee7598e2c8cc949ca4541ee9b823cc9a09ea8c50378a1bbe46e1a1ff'
            '5eae680e816a8124f0b227da33bf90637730a5ef2b32267b89344369f866c609')
sha256sums_i686=('2326f57fda040cdd09158d00fea51b85cbc277f99e002579bc4bc4b44f933c3d')
sha256sums_x86_64=('4b3d961db8b3f7274aadcc8d5c45b791516dd6a92e37a7c96dae6ee2167af0ac')
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
