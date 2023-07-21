# Maintainer: Yusuke Takahashi <yusuke@remote.it>
pkgname=remoteit
pkgver=4.18.4
pkgrel=1
pkgdesc="remote.it is a cloud service that provides secure connections."
url="https://remote.it"
license=('MIT')
arch=('x86_64')
depends=('curl' 'jq>=1.5')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=$pkgname.install
source=("connectd"
        "schannel"
        "muxer"
        "demuxer"
        "functions.sh"
        "oem.sh"
        "refresh.sh"
        "remoteit.sh"
        "schannel.conf"
        "systemd.sh"
        "task_notify.sh"
        "remoteit@.service"
        "remoteit-refresh.service"
        "schannel.service"
        "LICENSE"
        "version.txt")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

package() {
  install -d "$pkgdir/usr/share/$pkgname/"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -d "$pkgdir/usr/lib/systemd/system/"
  install -m755 "$srcdir/connectd" "$pkgdir/usr/share/$pkgname/"
  install -m755 "$srcdir/schannel" "$pkgdir/usr/share/$pkgname/"
  install -m755 "$srcdir/muxer" "$pkgdir/usr/share/$pkgname/"
  install -m755 "$srcdir/demuxer" "$pkgdir/usr/share/$pkgname/"
  install -m755 "$srcdir/functions.sh" "$pkgdir/usr/share/$pkgname/"
  install -m755 "$srcdir/oem.sh" "$pkgdir/usr/share/$pkgname/"
  install -m755 "$srcdir/refresh.sh" "$pkgdir/usr/share/$pkgname/"
  install -m755 "$srcdir/remoteit.sh" "$pkgdir/usr/share/$pkgname/"
  install -m644 "$srcdir/schannel.conf" "$pkgdir/usr/share/$pkgname/"
  install -m755 "$srcdir/systemd.sh" "$pkgdir/usr/share/$pkgname/"
  install -m755 "$srcdir/task_notify.sh" "$pkgdir/usr/share/$pkgname/"
  install -m644 "$srcdir/version.txt" "$pkgdir/usr/share/$pkgname/"
  install -m644 "$srcdir/remoteit@.service" "$pkgdir/usr/lib/systemd/system/"
  install -m644 "$srcdir/remoteit-refresh.service" "$pkgdir/usr/lib/systemd/system/"
  install -m644 "$srcdir/schannel.service" "$pkgdir/usr/lib/systemd/system/"
  install -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"

}
