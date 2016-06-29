# Maintainer: larte <lauri.arte@gmail.com>
pkgname=kubectl-bin
pkgdesc="Kubernetes.io client binary"
pkgver=1.2.5
pkgrel=1
arch=('i686' 'x86_64')
url="http://kubernetes.io"
license=('apache')
source=(https://github.com/kubernetes/kubernetes/releases/download/v$pkgver/kubernetes.tar.gz)
md5sums=('69d770df8fa4eceb57167e34df3962ca')
package() {
    case $CARCH in
        i686)
            _kubectl_arch="386";
            ;;
        x86_64)
            _kubectl_arch="amd64";
            ;;
        *)

        ;;
    esac
    install -d "${pkgdir}"/usr/bin/
    install -D "${srcdir}"/kubernetes/platforms/linux/${_kubectl_arch}/kubectl "$pkgdir/usr/bin/"

}
