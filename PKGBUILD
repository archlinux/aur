# Maintainer: Gary van der Merwe <garyvdm@gmail.com>
pkgname=openshift-origin-client-tools
pkgver=1.3.1
pkgver_git_sha=dad658de7465ba8a234a4fb40b5b446a45a4cee1
pkgrel=1
pkgdesc="OpenShift command line interface (CLI) ('oc' command), create applications and manage OpenShift projects from a terminal."
arch=('i686' 'x86_64')
url="https://github.com/openshift/origin/"
license=('Apache')
source_x86_64=("https://github.com/openshift/origin/releases/download/v$pkgver/openshift-origin-client-tools-v$pkgver-$pkgver_git_sha-linux-64bit.tar.gz")
source_i386=("https://github.com/openshift/origin/releases/download/v$pkgver/openshift-origin-client-tools-v$pkgver-$pkgver_git_sha-linux-32bit.tar.gz")
sha256sums_x86_64=("2e25d7da6748562f10138a7616a7c027c3025086e08b42355978aebfed4da718")
sha256sums_i386=("72ab655a7e5068bba654b774ef614715a7baba011e7305f6796bda829d59192e")


package() {
    case "$pkgarch" in
     i386) source_arch="linux-32bit" ;;
     x86_64) source_arch="linux-64bit" ;;
    esac
    source_name="$pkgname-v$pkgver-$pkgver_git_sha-$source_arch"
    
	cd "$source_name"
	echo "$pkgdir/usr/bin"
	install -D oc "$pkgdir/usr/bin/oc"
	install -D README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
