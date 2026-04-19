# Maintainer: agony <27015 at riseup dot net>
pkgname=memos-bin
pkgver=0.27.1
pkgrel=1
pkgdesc="A privacy-first, lightweight note-taking service. Easily capture and share your great thoughts."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/usememos/memos"
license=('MIT')
depends=('glibc')
provides=('memos')
conflicts=('memos' 'memos-git')
install=$pkgname.install
backup=('etc/memos.conf')
source_x86_64=("memos-${pkgver}-x86_64.tar.gz::https://github.com/usememos/memos/releases/download/v${pkgver}/memos_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("memos-${pkgver}-aarch64.tar.gz::https://github.com/usememos/memos/releases/download/v${pkgver}/memos_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("memos-${pkgver}-armv7h.tar.gz::https://github.com/usememos/memos/releases/download/v${pkgver}/memos_${pkgver}_linux_armv7.tar.gz")
source=("memos.service"
        "memos-sysusers.conf"
        "memos-tmpfiles.conf"
        "memos.conf")
sha256sums=('956a0895ba490d7057048ed4458172d5b70b726e82127f4505cf95f9d9dcd0f3'
            'eaf0d053c5673176c730085493db4d63b15e212e101fc02c9f9236f8f91abf20'
            'ed17b9db8aadd8518a3da01e45b5445a819bdb0f7ccd8bc1acc9f52cc02964fc'
            '814427de1a8fcf9b6e10b184a812ca61b8a82c1901ab61675fb8d9f2cdd99493')
sha256sums_x86_64=('58f3b4718e259b5a5a36ed60a26bd4648ec91a639c2a9ac9ce59908de088c3fd')
sha256sums_aarch64=('1f3fd32b6aa37f95c105760f64eb5cd1f9fb8694a261978fc5e4710c6532e82f')
sha256sums_armv7h=('1b865d09818b16c3e4ba8ef860b949ecf38da265713125a547d2a6fbd178e1bd')

package() {
  install -Dm755 memos "$pkgdir/usr/bin/memos"
  install -Dm644 memos.service "$pkgdir/usr/lib/systemd/system/memos.service"
  install -Dm644 memos-sysusers.conf "$pkgdir/usr/lib/sysusers.d/memos.conf"
  install -Dm644 memos-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/memos.conf"
  install -Dm644 memos.conf "$pkgdir/etc/memos.conf"
}
