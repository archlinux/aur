# Maintainer: Thor77 <thor77 at thor77 dot org>
# Contributor (backup): Thomas Fanninger <thomas at fanninger dot at>

pkgname=linx-server-bin
_name=linx-server
pkgver=2.3.3
pkgrel=1
pkgdesc='Self-hosted file/code/media sharing website '
arch=('i686' 'x86_64' 'arm')
url='https://github.com/andreimarcu/linx-server'
license=('GPL3')
install=linx-server.install
options=('!strip')
noextract=("${_name}-${pkgver}")
backup=('etc/webapps/linx-server/config.ini')
conflicts=('linx-server')

source=('linx-server.service' 'config.ini')
sha256sums=('96dda375b90c57e137b95442b8d4a24a5b763915eb1b8359e893f53af5db9630'
            'e7bbd0e1c16447665b5ef8bfa0855760e758921d936e1981e15537dc9e8f3035')
sha256sums_i686=('abf1a80d7634d3f50f742fbb28cbeb56d5556b9b01a5bb46ed31d766e057aff0')
sha256sums_x86_64=('f479642beba70b44a381fbc8e1c3e5cb485144e0aa005de8e8eafd6a490f8f84')
sha256sums_arm=('9ae90555637324bb9684a22d72a3752eb44077d27b286133410bc98e252f6df3')

source_i686=("${_name}-${pkgver}::https://github.com/andreimarcu/linx-server/releases/download/v$pkgver/linx-server-v${pkgver}_linux-386")
source_x86_64=("${_name}-${pkgver}::https://github.com/andreimarcu/linx-server/releases/download/v$pkgver/linx-server-v${pkgver}_linux-amd64")
source_arm=("${_name}-${pkgver}::https://github.com/andreimarcu/linx-server/releases/download/v$pkgver/linx-server-v${pkgver}_linux-arm")


package() {
  cd $srcdir
  install -Dm755 "${_name}-${pkgver}" "$pkgdir/usr/bin/$_name"
  install -Dm644 config.ini "$pkgdir/etc/webapps/${_name}/config.ini"
  install -Dm644 linx-server.service "$pkgdir/usr/lib/systemd/system/${_name}.service"
  install -d "$pkgdir/usr/share/webapps/$_name"
}
