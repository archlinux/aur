# Maintainer: VintellX <vin@vintellx.com>

pkgname=vinmail
pkgver=1.0.0
pkgrel=1
pkgdesc="Interactive Bash-based mail client for msmtp with multi-account management and GPG support."
arch=('any')
url="https://github.com/VintellX/vinmail"
license=('MIT')
depends=('bash' 'msmtp')
makedepends=('git')
optdepends=(
    'vim: default editor for composing mail and editing configs'
    'gnupg: GPG password encryption'
    'file: accurate MIME type detection for attachments'
    'neovim: alternative editor'
    'nano: alternative editor'
)
source=("git+${url}.git#tag=v${pkgver}?signed")
validpgpkeys=("06DDA9E2D7EB680B714DFB029891B64986124761")  # VintellX <vin@vintellx.com>
sha256sums=('SKIP')

package() {
    cd "${pkgname}"

    install -Dm755 usr/bin/vinmail \
        "${pkgdir}/usr/bin/vinmail"

    install -Dm644 usr/lib/vinmail/core.sh \
        "${pkgdir}/usr/lib/vinmail/core.sh"
    install -Dm644 usr/lib/vinmail/ui.sh \
        "${pkgdir}/usr/lib/vinmail/ui.sh"
    install -Dm644 usr/lib/vinmail/accounts.sh \
        "${pkgdir}/usr/lib/vinmail/accounts.sh"
    install -Dm644 usr/lib/vinmail/compose.sh \
        "${pkgdir}/usr/lib/vinmail/compose.sh"

    install -Dm644 usr/share/vinmail/account.conf.template \
        "${pkgdir}/usr/share/vinmail/account.conf.template"
    install -Dm644 usr/share/vinmail/mailrc \
        "${pkgdir}/usr/share/vinmail/mailrc"

    install -Dm644 usr/share/man/man1/vinmail.1 \
        "${pkgdir}/usr/share/man/man1/vinmail.1"

    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
