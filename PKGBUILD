# Maintainer: agony <27015 at riseup dot net>
pkgname=memos-bin
pkgver=0.31.0
pkgrel=2
pkgdesc="A privacy-first, lightweight note-taking service. Easily capture and share your great thoughts."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/usememos/memos"
license=('MIT')
provides=('memos')
conflicts=('memos' 'memos-git')
install=$pkgname.install
backup=('etc/memos.conf')
source_x86_64=("https://github.com/usememos/memos/releases/download/v${pkgver}/memos_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/usememos/memos/releases/download/v${pkgver}/memos_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/usememos/memos/releases/download/v${pkgver}/memos_${pkgver}_linux_armv7.tar.gz")
source=("memos-${pkgver}-LICENSE::https://raw.githubusercontent.com/usememos/memos/v${pkgver}/LICENSE"
        "memos.service"
        "memos-sysusers.conf"
        "memos-tmpfiles.conf"
        "memos.conf")
sha256sums=('dadc85262cec40d1344736b57da50814194ff721ab98012c09cd9d35c4b8582a'
            '956a0895ba490d7057048ed4458172d5b70b726e82127f4505cf95f9d9dcd0f3'
            'eaf0d053c5673176c730085493db4d63b15e212e101fc02c9f9236f8f91abf20'
            'ed17b9db8aadd8518a3da01e45b5445a819bdb0f7ccd8bc1acc9f52cc02964fc'
            '0e0b2a4e83ecb837055a59ee19c869586b2c74abeaa3b7a43fff95c19bd34e4d')
sha256sums_x86_64=('d99bf9de5e947cd41f7f1ae59e1e97d9af933d1bcc2d1316b3ab1ffe0a69e5c0')
sha256sums_aarch64=('97489ad1dd669cf63cda411f670ad0c5669148562a27364cb9e54e7ee79e9d4b')
sha256sums_armv7h=('5bf0c71d9e85914532a3bbc59e5a9b2dc481bd75bf777f5aef3ace9cbaa4b436')

package() {
  install -Dm755 memos "$pkgdir/usr/bin/memos"
  install -Dm644 memos.service "$pkgdir/usr/lib/systemd/system/memos.service"
  install -Dm644 memos-sysusers.conf "$pkgdir/usr/lib/sysusers.d/memos.conf"
  install -Dm644 memos-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/memos.conf"
  install -Dm644 memos.conf "$pkgdir/etc/memos.conf"
  install -Dm644 "memos-${pkgver}-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
