# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>
# Contributor: Semyon Ivanov <semyon95@gmail.com>

_pkgname=devspace
pkgname=${_pkgname}-bin
_pkgver=5.17.0
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="The Fastest Developer Tool for Kubernetes, develop software directly inside Kubernetes"
arch=('x86_64')
url='https://devspace.sh'
license=('Apache')
source=($pkgname-$pkgver::https://github.com/loft-sh/${_pkgname}/releases/download/v$_pkgver/devspace-linux-amd64)
sha256sums=('5683b3217d54351a2fd033c27c61129aff54f474a6b2775b0f476c82fb908bf3')

package() {
    install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/${_pkgname}"
    "$pkgdir/usr/bin/${_pkgname}" completion zsh > zsh-completion
    "$pkgdir/usr/bin/${_pkgname}" completion bash > bash.sh
    install -Dm 755 zsh-completion "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
    install -Dm 755 bash.sh "$pkgdir/etc/bash_completion.d/${_pkgname}_complete"
}
