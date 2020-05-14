# Maintainer: Thor77 <thor77 at thor77 dot org>
# Contributor (backup): Thomas Fanninger <thomas at fanninger dot at>

pkgname=linx-server-bin
_name=linx-server
pkgver=2.3.5
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
sha256sums_i686=('7bc40ba8e781aee2ad0bd103bcc7e4e8ae828294d6abdc58ec9be9a49262a3b8')
sha256sums_x86_64=('a407aada035b84e6c65b9b5b9384589116d5c78d1fc6d61dfabf5492f96c23fd')
sha256sums_arm=('7aa6044252362986370300b76880d5f7ff4852373aebc8625532784de57f636d')

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
