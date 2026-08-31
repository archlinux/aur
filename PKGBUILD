# Maintainer: Serhan Aydinicen <saydinicen9@gmail.com>

pkgname=dockswain
_id=com.conqrex.dockswain
pkgver=0.8.10
pkgrel=1
pkgdesc='KDE Plasma 6 fleet health and Docker management widget over SSH'
arch=('any')
url='https://github.com/Conqrex/Conqrex.Dockswain'
license=('MIT')
depends=('plasma-workspace' 'prison' 'jq' 'openssh' 'libnotify')
optdepends=('sshpass: password (non-key) SSH authentication'
            'libsecret: keep passwords in the keyring (secret-tool)'
            'rsync: faster file transfers with live progress'
            'python3: import servers from FileZilla'
            'konsole: open shells and exec into containers'
            'kate: edit remote files (nginx, compose) over SSH')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c876b36563d5c433f331ddd8f41a6329d24e70476ac2563a5428b59c1e5c5191')

package() {
    install -dm755 "$pkgdir/usr/share/plasma/plasmoids/$_id"
    # the extracted tarball has one top dir; copy the plasmoid payload into place
    cp -a "$srcdir"/*/package/. "$pkgdir/usr/share/plasma/plasmoids/$_id/"
    install -Dm644 "$srcdir"/*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
