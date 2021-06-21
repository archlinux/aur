# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>
# Contributor: Semyon Ivanov <semyon95@gmail.com>

_pkgname=devspace
pkgname=${_pkgname}-bin
_pkgver=5.14.2
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="The Fastest Developer Tool for Kubernetes, develop software directly inside Kubernetes"
arch=('x86_64')
url='https://devspace.sh'
license=('Apache')
source=($pkgname-$pkgver::https://github.com/loft-sh/${_pkgname}/releases/download/v$_pkgver/devspace-linux-amd64
        $pkgname-$pkgver-src::https://github.com/loft-sh/${_pkgname}/archive/refs/tags/v${_pkgver}.tar.gz)
sha256sums=('b187fcd3214369a0bbd267de137393d4e675ede7ee78033245832eac825089bb'
            '352020b517b1ac0f3197e08775c2e33ac97e547a1893858fa2c685dfa2d79183')

package() {
    install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/${_pkgname}"
    install -Dm 755 "$_pkgname-$_pkgver/completion/zsh-completion"  "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
    install -Dm 755 "$_pkgname-$_pkgver/completion/bash.sh"  "$pkgdir/etc/bash_completion.d/${_pkgname}_complete"
}
