# Maintainer: fkzys <fkzys at proton dot me>
pkgname=keys-vault
pkgver=1.0.0
pkgrel=1
pkgdesc="File-based encryption for sensitive directories via gocryptfs + GNOME Keyring"
arch=('any')
url="https://github.com/fkzys/keys-vault"
license=('AGPL-3.0-or-later')
depends=(
    'gocryptfs'
    'libsecret'
    'fuse-common'
)
optdepends=(
    'gnome-keyring: Secret Service provider'
    'bash-completion: bash tab completions'
    'zsh: zsh tab completions'
)
backup=('etc/keys-vault.conf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e38466966d7d0571a4beddb28cca180b69932981ef1a1477ba3a7eacc4397f9d')

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
