# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: naund

pkgname='zsh-autosuggestions'
pkgver=0.4.0
pkgrel=2
pkgdesc='Fish-like autosuggestions for zsh'
url='https://github.com/zsh-users/zsh-autosuggestions'
arch=('any')
license=('Custom:MIT')
depends=('zsh')
provides=('zsh-autosuggestions-git')
conflicts=('zsh-autosuggestions-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zsh-users/${pkgname}/tarball/v${pkgver}")
install="${pkgname}.install"
md5sums=('e7e1a9869039c52064e8043d26a3bec5')

package() {
    install -d "${pkgdir}/usr/share/zsh/plugins/${pkgname}"
    install -Dm644 "${srcdir}/zsh-users-${pkgname}"-*"/zsh-autosuggestions"{.plugin,}".zsh" \
                   "${pkgdir}/usr/share/zsh/plugins/${pkgname}"

    # license
    install -Dm644 "${srcdir}/zsh-users-${pkgname}"-*"/LICENSE" \
                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

