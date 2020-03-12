# Maintainer: Thor77 <thor77 at thor77 dot org>
# Contributor (backup): Thomas Fanninger <thomas at fanninger dot at>

pkgname=linx-server-bin
_name=linx-server
pkgver=2.2.3
pkgrel=1
pkgdesc='Self-hosted file/code/media sharing website '
arch=('i686' 'x86_64' 'arm')
url='https://github.com/andreimarcu/linx-server'
license=('GPL3')
install=linx-server.install
options=('!strip')
noextract=('linx-server')
backup=('etc/webapps/linx-server/config.ini')
noextract=("${_name}-${pkgver}")
conflicts=('linx-server')

source=('linx-server.service' 'config.ini')
sha256sums=('96dda375b90c57e137b95442b8d4a24a5b763915eb1b8359e893f53af5db9630'
            'e7bbd0e1c16447665b5ef8bfa0855760e758921d936e1981e15537dc9e8f3035')
sha256sums_i686=('7c4f775b427703b1cbdfb86775557b1064aa3cd5c344a681481cefbbc386105a')
sha256sums_x86_64=('1266aa2ea990a1567c06f2a1df48e9afcc4494df45f2c6b2751aa87fdbdc0243')
sha256sums_arm=('9b24567ee1fbfd1c647b17ffcc4cd89aae1a9fb6417baf72c7a7210c7e88f137')

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
