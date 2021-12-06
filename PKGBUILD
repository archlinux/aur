# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=2.8.3
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

sha256sums_x86_64=('b987b0e7b5db89c201316f6714253f44e58685a1c2324b5c17d42e90ffbbd92d')
sha256sums_i686=('86b5e9fa83dcda6538653d96ef0798072c495e696e07f1099d24e976db967c7a')
sha256sums_armv7h=('965fb11e3122047e63c725ce6d9f153e2fca0a13291c14edc02b21a106166ad5')
sha256sums_aarch64=('746cb98bd6e6b8945078aed5c2ab4f0b9ec7e9350d1e52854e8a5e34f3954ada')

package() {
  install -Dm755 "$_artifact_name" "$pkgdir/usr/bin/jfrog"
}
