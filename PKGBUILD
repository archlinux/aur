# Maintainer: tee < teeaur at duck dot com >
pkgname=lakefs-bin
pkgver=1.76.0
pkgrel=1
pkgdesc="Data version control for your data lake | Git for data"
arch=(x86_64 aarch64)
url="https://github.com/treeverse/lakeFS"
license=('Apache-2.0')
provides=('lakefs')
conflicts=('lakefs')
source_x86_64=("$url/releases/download/v$pkgver/lakeFS_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/lakeFS_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('60183aaf198f7b81ad0cb95d7604f48d1261acc267832c7e344ba2dee4694726')
sha256sums_aarch64=('7b6af979776bc9137d314cc539e3833a304bb11113e378f7b3cac9e1039ff8c5')

package() {
    install -Dm755 lakefs -t "$pkgdir/usr/bin"
    install -Dm755 lakectl -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
