# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>
# Contributor: Semyon Ivanov <semyon95@gmail.com>

_pkgname=devspace
pkgname=${_pkgname}-bin
_pkgver=5.12.2
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="The Fastest Developer Tool for Kubernetes, develop software directly inside Kubernetes"
arch=('x86_64')
url='https://devspace.sh'
license=('Apache')
source=($pkgname-$pkgver::https://github.com/loft-sh/${_pkgname}/releases/download/v$_pkgver/devspace-linux-amd64
        $pkgname-$pkgver-src::https://github.com/loft-sh/${_pkgname}/archive/refs/tags/v${_pkgver}.tar.gz)
sha256sums=('5b03f25edbbf8367a34a469eb3bb60e0eef2dceb36c80e69f1b47031fb1b6dc6'
            '144770b8228fa9842c2de38d89e51f3762b94cf9d8aab251868fff1b11fb8fe6')

package() {
    install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/${_pkgname}"
    install -Dm 755 "$_pkgname-$_pkgver/completion/zsh-completion"  "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
    install -Dm 755 "$_pkgname-$_pkgver/completion/bash.sh"  "$pkgdir/etc/bash_completion.d/${_pkgname}_complete"
}
