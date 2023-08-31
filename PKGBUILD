# Maintainer: Kyle Westhaus <kwesthaus+aur at gmail dot com>
# Maintainer: Kevin Orr <kevinorr54+aur at gmail dot com>
# Contributor: Kaley Main <kaleypoole17 at gmail dot com>
# Contributor: John Trengrove <john at retrofilter dot com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=dgraph-bin
pkgver=23.1.0
pkgrel=1
pkgdesc='Fast, transactional, distributed graph database'
arch=('x86_64')
url='https://github.com/dgraph-io/dgraph'
license=('APACHE' 'custom:DCL')
provides=('dgraph' 'badgerdb')
conflicts=('dgraph' 'dgraph-git' 'badgerdb')
install=$pkgname.install
source=("dgraph-$pkgver.tar.gz::$url/releases/download/v$pkgver/dgraph-linux-amd64.tar.gz"
        "dgraph-$pkgver.tar.gz.sha256::$url/releases/download/v$pkgver/dgraph-checksum-linux-amd64.sha256"
        "badger-$pkgver.tar.gz::$url/releases/download/v$pkgver/badger-linux-amd64.tar.gz"
        "badger-$pkgver.tar.gz.sha256::$url/releases/download/v$pkgver/badger-checksum-linux-amd64.sha256"
        "$url/raw/v$pkgver/licenses/DCL.txt"
        "$url/raw/v$pkgver/contrib/systemd/centos/dgraph-alpha.service"
        "$url/raw/v$pkgver/contrib/systemd/centos/dgraph-zero.service"
        "$url/raw/v$pkgver/contrib/systemd/centos/add_dgraph_account.sh")
sha256sums=('45a4e169e7a19a1d564e019ca6e4477d482ac4c41e8361b01b7d6633e1fb98f1'
            '183fc799c8b9ea3135595e00c5c926382be2eb976e7f19e4693b5b74e6ff4d27'
            'a50101d04f47153139ea5e2a09e7c4c243c37d9137dead20034dd77f8c74b88c'
            'a4cc988284f651e850b85b02b41a8d4d6a4a22e967bf679b89dc0d14d8d189e3'
            'bfdc75136567068dd049c2d226049a57de5f4a1871eab7429c022e95952efb0d'
            'b0436225ea1b65e47cea0e4bc039bcf5c795330f352b6333a99e84f5bd000d23'
            '1d17f53b5f83f434ce918c1f13a7b5829b0c2d20ccad13aa44486a00d7b6bc6a'
            'cf80944157c7af97d0bcd18a6d4b5f6a4ba14941f47ff8b19977b7477ee2b865')

package() {
  cd "$srcdir"
  install -Dm644 DCL.txt "$pkgdir/usr/share/licenses/$pkgname/DCL.txt"
  install -Dm755 dgraph "$pkgdir/usr/bin/dgraph"
  install -Dm755 badger-linux-amd64 "$pkgdir/usr/bin/badger"
  install -Dm644 dgraph-alpha.service "$pkgdir/usr/lib/systemd/system/dgraph-alpha.service"
  install -Dm644 dgraph-zero.service "$pkgdir/usr/lib/systemd/system/dgraph-zero.service"
  install -Dm755 add_dgraph_account.sh "$pkgdir/usr/share/dgraph/add_dgraph_account.sh"
}

# vim:set ts=2 sw=2 et:
