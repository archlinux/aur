# Maintainer: Arturo Penen <apenen@gmail.com>
# Contributor: David Birks <david@birks.dev>
# Contributor: Jacob Mason <jacob@jacobmason.net>

pkgname=jx
pkgver=3.10.69
pkgrel=1
pkgdesc='Command line tool for working with Jenkins X'
arch=('x86_64')
url='https://github.com/jenkins-x/jx'
license=('Apache')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jenkins-x/jx/archive/v$pkgver.tar.gz")
sha256sums=('102d5d5d6c870d1959b6339bab38ef8ae5329ff019406176583519e248e966e6')

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
