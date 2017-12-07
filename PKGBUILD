# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: naund

pkgname='zsh-autosuggestions'
pkgver=0.4.2
pkgrel=1
pkgdesc='Fish-like autosuggestions for zsh'
url='https://github.com/zsh-users/zsh-autosuggestions'
arch=('any')
license=('Custom:MIT')
depends=('zsh')
provides=('zsh-autosuggestions-git')
conflicts=('zsh-autosuggestions-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zsh-users/${pkgname}/tarball/v${pkgver}")
install="${pkgname}.install"
sha512sums=('e80a3fbfda3f5b24a3bbfa6690f877f89c5795e47188c9ea5d07c6484d363119d84992bbee579c6768402882e3f22a0019829b327593d3ebb17658a98043c5df')

package() {
    install -d "${pkgdir}/usr/share/zsh/plugins/${pkgname}"
    install -Dm644 "${srcdir}/zsh-users-${pkgname}"-*"/zsh-autosuggestions"{.plugin,}".zsh" \
                   "${pkgdir}/usr/share/zsh/plugins/${pkgname}"

    # license
    install -Dm644 "${srcdir}/zsh-users-${pkgname}"-*"/LICENSE" \
                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

