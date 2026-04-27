# Maintainer: agony <27015 at riseup dot net>
pkgname=memos-bin
pkgver=0.28.0
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
sha256sums_x86_64=('16c05e1758c6e17db7d833eb86e7e4583894495ae76909c76b7f5b215d08d62f')
sha256sums_aarch64=('b1a9f3c1efcd6d4e8ed8e2960028a7382b5c526523436ad81f0bafbc2b05ef79')
sha256sums_armv7h=('c395bfca531d358397de2cee46202734dc7fe9896eb51976a47b15be878de439')

package() {
  install -Dm755 memos "$pkgdir/usr/bin/memos"
  install -Dm644 memos.service "$pkgdir/usr/lib/systemd/system/memos.service"
  install -Dm644 memos-sysusers.conf "$pkgdir/usr/lib/sysusers.d/memos.conf"
  install -Dm644 memos-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/memos.conf"
  install -Dm644 memos.conf "$pkgdir/etc/memos.conf"
}
