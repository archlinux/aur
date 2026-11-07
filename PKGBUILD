# Maintainer: fkzys <fkzys at proton dot me>
pkgname=keys-vault
pkgver=1.0.2
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
sha256sums=('ba5a6b115e3d93376794057bf2a2021c1e3d2810ea76dbe7b763878e1ed9f927')

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
