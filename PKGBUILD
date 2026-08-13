# Maintainer: Serhan Aydinicen <saydinicen9@gmail.com>

pkgname=dockswain
_id=com.conqrex.dockswain
pkgver=0.8.7
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
sha256sums=('3d7e8dddcad20450bc02ccf0e3eda52de6da6a12460f2bd9153b7e8d6b13bb54')

package() {
    install -dm755 "$pkgdir/usr/share/plasma/plasmoids/$_id"
    # the extracted tarball has one top dir; copy the plasmoid payload into place
    cp -a "$srcdir"/*/package/. "$pkgdir/usr/share/plasma/plasmoids/$_id/"
    install -Dm644 "$srcdir"/*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
