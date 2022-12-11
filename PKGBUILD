pkgname='git-remote-gcrypt'
pkgver='1.5'
pkgrel=1
pkgdesc='A git remote helper for GPG-encrypted remotes.'
arch=(any)
url='https://spwhitton.name/tech/code/git-remote-gcrypt/'
license=(GPL)
makedepends=(git python-docutils)
depends=(git gnupg bash)
optdepends=('rsync: rsync backend support'
            'curl: sftp backend support'
            'rclone: rclone backend support')
conflicts=(git-remote-gcrypt-git)
source=("https://git.spwhitton.name/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0a0b8359eccdd5d63eaa3b06b7a24aea813d7f1e8bf99536bdd60bc7f18dca03')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    DESTDIR="$pkgdir/" prefix="/usr" ./install.sh
}
