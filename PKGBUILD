# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
_pkgname=lambda-mod-zsh-theme
pkgname=$_pkgname-git
pkgver=r21.61c373c
pkgrel=1
pkgdesc='A ZSH theme optimized for people who use git and unicode-compatible fonts and terminals'
arch=('any')
url='https://github.com/halfo/lambda-mod-zsh-theme/'
license=('MIT')
depends=('zsh' 'oh-my-zsh-git')
source=('git+https://github.com/halfo/lambda-mod-zsh-theme.git')
sha256sums=('SKIP')
makedepends=('git')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -D -m644 lambda-mod.zsh-theme "${pkgdir}/usr/share/oh-my-zsh/themes/lambda-mod.zsh-theme"
}
