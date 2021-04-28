# Maintainer: Arturo Penen <apenen@gmail.com>
# Contributor: David Birks <david@birks.dev>
# Contributor: Jacob Mason <jacob@jacobmason.net>

pkgname=jx
pkgver=3.2.65
pkgrel=0
pkgdesc='Command line tool for working with Jenkins X'
arch=('x86_64')
url='https://github.com/jenkins-x/jx'
license=('Apache')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jenkins-x/jx/archive/v$pkgver.tar.gz")
sha256sums=('bbdafe3bd5c5810b1175bfc90584f38a3512842f7eff6b24a52c30ba41d42eb4')

build() {
  cd $pkgname-$pkgver
  export VERSION=$pkgver
  make build
}

package() {
  install -Dm 755 "${srcdir}/$pkgname-$pkgver/build/jx" "${pkgdir}/usr/bin/jx"

  ## Populate bash and zsh completions
  #install -dm 755 "${pkgdir}/usr/share/bash-completion/completions"
  #install -dm 755 "${pkgdir}/usr/share/zsh/site-functions"
  #"${pkgdir}/usr/bin/jx" completion bash > "${pkgdir}/usr/share/bash-completion/completions/jx"
  #"${pkgdir}/usr/bin/jx" completion zsh >  "${pkgdir}/usr/share/zsh/site-functions/_jx"
}
