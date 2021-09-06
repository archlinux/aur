# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>
# Contributor: Semyon Ivanov <semyon95@gmail.com>

_pkgname=devspace
pkgname=${_pkgname}-bin
_pkgver=5.15.0
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="The Fastest Developer Tool for Kubernetes, develop software directly inside Kubernetes"
arch=('x86_64')
url='https://devspace.sh'
license=('Apache')
source=($pkgname-$pkgver::https://github.com/loft-sh/${_pkgname}/releases/download/v$_pkgver/devspace-linux-amd64
        $pkgname-$pkgver-src::https://github.com/loft-sh/${_pkgname}/archive/refs/tags/v${_pkgver}.tar.gz)
sha256sums=('d96f15c0bfe856396f30d35307609df3f351c5b5bdc3cbf7ba3af0d0643c38d6'
            'f61706a654fdb85b224ef16ba95ccb0126fc5dd00cb9d7732717fb07d417fbcb')

package() {
    install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/${_pkgname}"
    install -Dm 755 "$_pkgname-$_pkgver/completion/zsh-completion"  "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
    install -Dm 755 "$_pkgname-$_pkgver/completion/bash.sh"  "$pkgdir/etc/bash_completion.d/${_pkgname}_complete"
}
