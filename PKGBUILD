# Contributor: Kyle Westhaus <kwesthaus+aur at gmail dot com>
# Contributor: Kevin Orr <kevinorr54+aur at gmail dot com>
# Contributor: Kaley Main <kaleypoole17 at gmail dot com>
# Contributor: John Trengrove <john at retrofilter dot com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=dgraph-bin
pkgver=24.1.4
pkgrel=1
pkgdesc='Fast, transactional, distributed graph database'
arch=('x86_64')
url='https://github.com/hypermodeinc/dgraph'
license=('Apache-2.0' 'custom:DCL')
provides=('dgraph' 'badgerdb')
conflicts=('dgraph' 'dgraph-git' 'badgerdb')
install="$pkgname.install"
source=("dgraph-$pkgver.tar.gz::$url/releases/download/v$pkgver/dgraph-linux-amd64.tar.gz"
        "dgraph-$pkgver.tar.gz.sha256::$url/releases/download/v$pkgver/dgraph-checksum-linux-amd64.sha256"
        "badger-$pkgver.tar.gz::$url/releases/download/v$pkgver/badger-linux-amd64.tar.gz"
        "badger-$pkgver.tar.gz.sha256::$url/releases/download/v$pkgver/badger-checksum-linux-amd64.sha256"
        "$url/raw/v$pkgver/licenses/DCL.txt"
        "$url/raw/v$pkgver/contrib/systemd/centos/dgraph-alpha.service"
        "$url/raw/v$pkgver/contrib/systemd/centos/dgraph-zero.service"
        "$url/raw/v$pkgver/contrib/systemd/centos/add_dgraph_account.sh")
sha256sums=('48725c3fab20c0532ca21e518b151a9eb2b5bae2418c629884c4558f891ce1e6'
            '6e9116039c9e44f9040e3db4d1cd3fc8f87e51695fe0d7784cf6d685e7764349'
            '7e54184194ee5305045136e56e82146906273de89069eae64a4db7db5c38338e'
            '46121984bc033c8fcc436d08fda817e128d9b3836b6798f5f194bcbc61d09f01'
            '5f245e21547ee20c65bde76a0b1db995a7dbfdd30f99de861036672cdebfb395'
            'b0436225ea1b65e47cea0e4bc039bcf5c795330f352b6333a99e84f5bd000d23'
            '1d717b444a2bd4a6a5bfe035c8e46bba8319793f9ca211c3d815fa24327dc37f'
            '3ae6aa66dc54919f3183ef0abec35ed11122f2ea49fa30c328b376a3fac69afd')

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
