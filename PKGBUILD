# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>
# Contributor: Semyon Ivanov <semyon95@gmail.com>

_pkgname=devspace
pkgname=${_pkgname}-bin
_pkgver=5.16.2
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="The Fastest Developer Tool for Kubernetes, develop software directly inside Kubernetes"
arch=('x86_64')
url='https://devspace.sh'
license=('Apache')
source=($pkgname-$pkgver::https://github.com/loft-sh/${_pkgname}/releases/download/v$_pkgver/devspace-linux-amd64
        $pkgname-$pkgver-src::https://github.com/loft-sh/${_pkgname}/archive/refs/tags/v${_pkgver}.tar.gz)
sha256sums=('1fe53f7146cf635cc8765911716e878a053b02fc66344ab43342a8df99d23ffb'
            '9c169f22877737fc950dcd97f52a6a2d38b5d3a108a5b73c4610e84c252bf51d')


package() {
    install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/${_pkgname}"
    install -Dm 755 "$_pkgname-$_pkgver/completion/zsh-completion"  "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
    install -Dm 755 "$_pkgname-$_pkgver/completion/bash.sh"  "$pkgdir/etc/bash_completion.d/${_pkgname}_complete"
}
