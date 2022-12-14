# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>
# Contributor: Semyon Ivanov <semyon95@gmail.com>

_pkgname=devspace
pkgname=${_pkgname}-bin
_pkgver=6.2.2
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="The Fastest Developer Tool for Kubernetes, develop software directly inside Kubernetes"
arch=('x86_64')
url='https://devspace.sh'
license=('Apache')
source=($pkgname-$pkgver::https://github.com/loft-sh/${_pkgname}/releases/download/v$_pkgver/devspace-linux-amd64)
sha256sums=('90c4c1717a13137a6d42568098b42681a47f87ec6a839bdf0356e98411bf0112')

package() {
    install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/${_pkgname}"
    "$pkgdir/usr/bin/${_pkgname}" completion zsh > zsh-completion
    "$pkgdir/usr/bin/${_pkgname}" completion bash > bash.sh
    install -Dm 644 zsh-completion "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
    install -Dm 644 bash.sh "$pkgdir/etc/bash_completion.d/${_pkgname}_complete"
}
