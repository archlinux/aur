# Contributor: Kyle Westhaus <kwesthaus+aur at gmail dot com>
# Contributor: Kevin Orr <kevinorr54+aur at gmail dot com>
# Contributor: Kaley Main <kaleypoole17 at gmail dot com>
# Contributor: John Trengrove <john at retrofilter dot com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=dgraph-bin
pkgver=25.0.0
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
sha256sums=('752e04949526b94aabd5e0bbaa9cac4a0260e12cfe2d7cdb36c5438b9c3bf3e8'
            '9a0a821a6f1c7a65504a820e326f3c2d85049a17dc6b6d2bccc4142e0d3e80ba'
            '8af2e6f64aa7fe850fcaffd94700a53ab639ae42ae78d70713f6f44158e15937'
            '74a449f7100f36530a8d2a8b0ccc5e2a2e01044a9bdcfeeb60069235f8ec7cad'
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
