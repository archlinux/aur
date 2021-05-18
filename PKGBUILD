# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>
# Contributor: Semyon Ivanov <semyon95@gmail.com>

_pkgname=devspace
pkgname=${_pkgname}-bin
_pkgver=5.13.0
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="The Fastest Developer Tool for Kubernetes, develop software directly inside Kubernetes"
arch=('x86_64')
url='https://devspace.sh'
license=('Apache')
source=($pkgname-$pkgver::https://github.com/loft-sh/${_pkgname}/releases/download/v$_pkgver/devspace-linux-amd64
        $pkgname-$pkgver-src::https://github.com/loft-sh/${_pkgname}/archive/refs/tags/v${_pkgver}.tar.gz)
sha256sums=('775c415e11761321457035297db4d6c02ebce9f804e6088881ed0a9fe3b2b8f8'
            'bf5751f3b487691ec11e41dd2d17fae5cf8f77af4d63dd106071240e4ed1cb33')

package() {
    install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/${_pkgname}"
    install -Dm 755 "$_pkgname-$_pkgver/completion/zsh-completion"  "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
    install -Dm 755 "$_pkgname-$_pkgver/completion/bash.sh"  "$pkgdir/etc/bash_completion.d/${_pkgname}_complete"
}
