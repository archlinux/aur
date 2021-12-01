# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=2.8.0
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/jfrog/jfrog-cli"
license=('Apache')
depends=('glibc')
conflicts=('jfrog-cli' 'jfrog-cli-go')
provides=('jfrog-cli')

_artifact_name="$pkgname-$pkgver-$pkgrel.jfrog"
_source_base="$_artifact_name::https://releases.jfrog.io/artifactory/$_pkgname/v2/$pkgver"

source_x86_64=("$_source_base/$_pkgname-linux-amd64/jfrog")
source_i686=("$_source_base/$_pkgname-linux-386/jfrog")
source_armv7h=("$_source_base/$_pkgname-linux-arm/jfrog")
source_aarch64=("$_source_base/$_pkgname-linux-arm64/jfrog")

noextract=("$_artifact_name")

sha256sums_x86_64=('aba6f35faa87055ce8354ab20a7ea0c992443427fcaeddf9e8d1442c2f1aa8c1')
sha256sums_i686=('e882157bab9338ba610f951ba410baee2b130cb32458a6f99527e30accb4386a')
sha256sums_armv7h=('054bf7a506111c10e01263b92bbdbcd90396aa659da328dcc61a9e2a971e7488')
sha256sums_aarch64=('390c1d4582a74f602e929838a4094c7deb8f51c59c8c65d3c46989f68fdac478')

package() {
  install -Dm755 "$_artifact_name" "$pkgdir/usr/bin/jfrog"
}
