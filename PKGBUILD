# Maintainer: Caleb Maclennan <caleb@alerque.com>

_project=fraunces
pkgbase=${_project}-font
pkgname=("ttf-$_project" "otf-$_project" "ttf-$_project-variable")
pkgver=1.000
pkgrel=1
pkgdesc='A display, “Old Style” soft-serif typeface inspired by early 20th century typefaces'
arch=('any')
url="https://github.com/undercasetype/${_project^}"
license=('OFL')
_foundry=UnderCaseType_
source=("$url/releases/download/$pkgver/$_foundry${_project^}_$pkgver.zip")
sha256sums=('8d8b81dfaeb89433f5c908e1d8d0a4b202bd627bd80d4cd5ff56f311fdcad19f')

package_otf-fraunces () {
    provides=("$pkgbase")
    cd "$_foundry${_project^}_$pkgver/Fonts - Desktop/static/otf"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" *.otf
}

package_ttf-fraunces () {
    provides=("$pkgbase")
    cd "$_foundry${_project^}_$pkgver/Fonts - Desktop/static/ttf"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
}

package_ttf-fraunces-variable () {
    pkgdesc+=" (variable)"
    cd "$_foundry${_project^}_$pkgver/Fonts - Desktop/"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
}
