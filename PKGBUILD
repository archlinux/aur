# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=2.10.1
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

sha256sums_x86_64=('0b7aaf63ab3d5ad8ef8a0acdddb6a7bdddb382e6763016a690e386dab825c47c')
sha256sums_i686=('7f4d177305d7ddee1766101d87744bdf36b58429b6f6e16af4c41711274f4522')
sha256sums_armv7h=('b5fd0b7b81451873859edc42a4ed2992446b172e3403e12b905f884d68e6aa16')
sha256sums_aarch64=('3478852efed1978a8a062800ff5366f60121dbf56550080bb4d9b3b34f6ef1ab')

package() {
  install -Dm755 "$_artifact_name" "$pkgdir/usr/bin/jfrog"
}
