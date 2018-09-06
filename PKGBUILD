# Maintainer: Giacomo Longo <gabibbo97@gmail.com>
pkgname=kubebuilder
pkgver=1.0.3
pkgrel=2
pkgdesc="SDK for building Kubernetes APIs"
url="https://github.com/kubernetes-sigs/kubebuilder"
license=('APACHE')
source=("https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${pkgver}/kubebuilder_${pkgver}_linux_amd64.tar.gz")
md5sums=('0605015b141a568c23d29088881f664b')
arch=('x86_64')

package() {
  # find . -type f -name '*gen*' -exec basename {} \; | sort | tr '\n' ' 
  BINARIES=(client-gen conversion-gen deepcopy-gen defaulter-gen gen-apidocs informer-gen kubebuilder kubebuilder-gen lister-gen openapi-gen)
  for binary in "${BINARIES[@]}"
  do
    install -Dm0755 "$srcdir/kubebuilder_${pkgver}_linux_amd64/bin/$binary" "$pkgdir/usr/local/bin/$binary"
  done
}
