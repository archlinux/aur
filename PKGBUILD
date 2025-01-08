# Maintainer: Sven Haardiek <sven@haardiek.de>

pkgname=argocd-vault-plugin
pkgver=1.18.1
pkgrel=2
pkgdesc='An Argo CD plugin to retrieve secrets from various Secret Management tools (HashiCorp Vault, IBM Cloud Secrets Manager, AWS Secrets Manager, etc.) and inject them into Kubernetes resources'
arch=('x86_64')
url='https://github.com/argoproj-labs/argocd-vault-plugin'
license=('apache')
depends=('glibc')
makedepends=('go' 'make')
source=("https://github.com/argoproj-labs/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('687141d21c1baaedab6b6d4f5e11e72faf6eec7f7d889be7095a48a888080e32')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  make
}

package() {
  install -Dm755 $srcdir/${pkgname}-${pkgver}/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
