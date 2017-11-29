# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: naund

pkgname='zsh-autosuggestions'
pkgver=0.4.1
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
sha512sums=('863a0c397997bcd9642890fa17fdeabe8dc7f8836b85c33ce70d1a091e6c495a46eae95c5810233e1114b5d9520090107b13be5b555b425d055e6fbb3405e2b7')

package() {
    install -d "${pkgdir}/usr/share/zsh/plugins/${pkgname}"
    install -Dm644 "${srcdir}/zsh-users-${pkgname}"-*"/zsh-autosuggestions"{.plugin,}".zsh" \
                   "${pkgdir}/usr/share/zsh/plugins/${pkgname}"

    # license
    install -Dm644 "${srcdir}/zsh-users-${pkgname}"-*"/LICENSE" \
                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

