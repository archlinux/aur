# Maintainer: agony <27015 at riseup dot net>
pkgname=memos-bin
pkgver=0.30.0
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
sha256sums_x86_64=('099b4e1717eb500707d8ff27a8152d30524c4521918ba7c489eb1dda15c4e57d')
sha256sums_aarch64=('446a68ee969e092304b5f9b23d9669418613e25a1aa700e9767ade5cb30f2684')
sha256sums_armv7h=('01cc8f490d8e3c1a4b993b695817789aa85a99db66719a290071b818d1e71f84')

package() {
  install -Dm755 memos "$pkgdir/usr/bin/memos"
  install -Dm644 memos.service "$pkgdir/usr/lib/systemd/system/memos.service"
  install -Dm644 memos-sysusers.conf "$pkgdir/usr/lib/sysusers.d/memos.conf"
  install -Dm644 memos-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/memos.conf"
  install -Dm644 memos.conf "$pkgdir/etc/memos.conf"
}
