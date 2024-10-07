# Maintainer: amos <amosonn(at)gmail(dot)com>

pkgname=libreoffice-extension-expandanimations
_pkgname=ExpandAnimations
pkgver=0.13
pkgrel=1
pkgdesc='An Open Source style and grammar checker (more than 30 languages)'
arch=('any')
url='https://languagetool.org'
license=('LGPL-3.0-or-later')
groups=('libreoffice-extensions')
depends=('libreoffice' 'java-runtime>=8')
source=("https://github.com/monperrus/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver.oxt")
sha512sums=('702e001c7f71c13addaebe19faa610afe526f5723eb7795dfc9173ca4d6650dfafdd3c0f8e3adeb88dfdb1ca02a6fc7f22294525a0fed59190b200ccaeafd189')

package() {
    local _dest="${pkgdir}/usr/lib/libreoffice/share/extensions/expandanimations/"
    install -dm755 "$_dest"
    cp -r "$srcdir"/* "$_dest"
    rm "$_dest/$_pkgname-$pkgver.oxt"
    #find "${_dest}" \( -type d -exec chmod 755 {} \; \) -o \( -type f -exec chmod 644 {} \; \)
}

# vim: ts=4 sw=4 et:
