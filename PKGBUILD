# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>
# Contributor: Semyon Ivanov <semyon95@gmail.com>

_pkgname=devspace
pkgname=${_pkgname}-bin
_pkgver=6.3.18
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="The Fastest Developer Tool for Kubernetes, develop software directly inside Kubernetes"
arch=('x86_64')
url='https://devspace.sh'
license=('Apache')
source=($pkgname-$pkgver::https://github.com/loft-sh/${_pkgname}/releases/download/v$_pkgver/devspace-linux-amd64)
sha256sums=('f36a08b8aad2500d26d23ceb2079df514a83799c12a143bfc08a0295c84feac7')

package() {
    install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/${_pkgname}"
    "$pkgdir/usr/bin/${_pkgname}" completion zsh > zsh-completion
    "$pkgdir/usr/bin/${_pkgname}" completion bash > bash.sh
    install -Dm 644 zsh-completion "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
    install -Dm 644 bash.sh "$pkgdir/etc/bash_completion.d/${_pkgname}_complete"
}
