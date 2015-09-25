# Maintainer: Christophe Robin <crobin at nekoo a-dot com>
# Why no integrity?
#   Because the develop of Manager releases several versions a week,
#   all using the same URL. I guess I could run something on my server
#   that updates this file when that happens but I don't have the time
#   at the moment, hence no integrity for now.

pkgname=manager.io
pkgver=15.5.61
pkgrel=1
pkgdesc="Manager is free accounting software for small business."
arch=('i686' 'x86_64')
url="http://www.manager.io"
source=("http://download.manager.io/Manager.deb")

pkgver() {
  zcat control.tar.gz | grep -a 'Version:' | cut -d ' ' -f 2
}

package() {
  msg2 "Extracting the data.tar.gz"
  tar -xf data.tar.xz -C "${pkgdir}/"
}

