# Maintainer: Junxuan Liao <mikeljx at 126 dot com>
# Contributor: Adam Schadler <ajschadler@gmail.com>
pkgname=vim-lumen
pkgver=1.0
pkgrel=1
pkgdesc="Vim plugin that makes vim follow your system-wide dark mode preference"
arch=('any')
url="https://github.com/vimpostor/vim-lumen"
license=('GPL-3.0-only')
groups=('vim-plugins')
depends=('vim-runtime' 'glib2')
optdepends=(
    "plasma-desktop: supported color switcher"
    "gnome-desktop: supported color switcher"
    "darkman: supported color switcher"
    "color-scheme-simulator: supported color switcher"
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('44593b97d0815695f9750211d00d41776ba11bcdc2a04b9db69ab9488bb235c1')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    local _installpath="${pkgdir}/usr/share/vim/vimfiles"
    install -d "${_installpath}"
    find autoload doc plugin -type f -exec \
        install -Dm 644 '{}' "${_installpath}/{}" \;
}

