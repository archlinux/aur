# Maintainer: agony <27015 at riseup dot net>
pkgname=memos-bin
pkgver=26.11.3
pkgrel=1
pkgdesc="Privacy-first, lightweight note-taking service (prebuilt)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/usememos/memos"
license=('MIT')
provides=('memos')
conflicts=('memos' 'memos-git')
install=$pkgname.install
backup=('etc/memos.conf')
source_x86_64=("https://github.com/usememos/memos/releases/download/${pkgver}/memos_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/usememos/memos/releases/download/${pkgver}/memos_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/usememos/memos/releases/download/${pkgver}/memos_${pkgver}_linux_armv7.tar.gz")
source=("memos-${pkgver}-LICENSE::https://raw.githubusercontent.com/usememos/memos/${pkgver}/LICENSE"
        "memos.service"
        "memos-sysusers.conf"
        "memos-tmpfiles.conf"
        "memos.conf")
sha256sums=('dadc85262cec40d1344736b57da50814194ff721ab98012c09cd9d35c4b8582a'
            '0c7d5102f95e7348c4791e2c919b3664c1124469c5174349c81153894affe2dd'
            'eaf0d053c5673176c730085493db4d63b15e212e101fc02c9f9236f8f91abf20'
            'ed17b9db8aadd8518a3da01e45b5445a819bdb0f7ccd8bc1acc9f52cc02964fc'
            '0e0b2a4e83ecb837055a59ee19c869586b2c74abeaa3b7a43fff95c19bd34e4d')
sha256sums_x86_64=('971f68a2ecd5ab97a42d058deec8b2e91a52eb43de7d3128b16b7b04fa5b5590')
sha256sums_aarch64=('96a31f7a22a30b2a1164b3242467fdc1c2f21b0342599b5337b91729a04793e1')
sha256sums_armv7h=('018733e446940e75c42b8deeeaabd5871a8214af2295395db086b1e591a7dcb0')

package() {
  install -Dm755 memos "$pkgdir/usr/bin/memos"
  install -Dm644 memos.service "$pkgdir/usr/lib/systemd/system/memos.service"
  install -Dm644 memos-sysusers.conf "$pkgdir/usr/lib/sysusers.d/memos.conf"
  install -Dm644 memos-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/memos.conf"
  install -Dm644 memos.conf "$pkgdir/etc/memos.conf"
  install -Dm644 "memos-${pkgver}-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
